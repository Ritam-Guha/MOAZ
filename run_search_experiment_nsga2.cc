// Copyright 2021 The Google Research Authors.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

// Runs the RegularizedEvolution algorithm locally.

#include <algorithm>
#include <iostream>
#include <limits>
#include <memory>
#include <random>
#include <string>
#include <fstream>
#include <ctime>
#include <filesystem>


#include "algorithm.h"
#include "task_util.h"
#include "task.pb.h"
#include "definitions.h"
#include "instruction.pb.h"
#include "evaluator.h"
#include "experiment.pb.h"
#include "compute_cost_new.h"
#include "experiment_util.h"
#include "fec_cache.h"
#include "generator.h"
#include "mutator.h"
#include "random_generator.h"
#include "regularized_evolution.h"
#include "nsga2.h"
#include "train_budget.h"
#include "google/protobuf/text_format.h"
#include "absl/flags/flag.h"
#include "absl/flags/parse.h"
#include "absl/time/time.h"

typedef automl_zero::IntegerT IntegerT;
typedef automl_zero::RandomSeedT RandomSeedT;
typedef automl_zero::InstructionIndexT InstructionIndexT;

ABSL_FLAG(
        std::string, search_experiment_spec, "",
"Specification for the experiment. Must be an SearchExperimentSpec "
"proto in text-format. Required.");
ABSL_FLAG(
        std::string, final_tasks, "",
"The tasks to use for the final evaluation. Must be a TaskCollection "
"proto in text format. Required.");
ABSL_FLAG(
        IntegerT, max_experiments, 10,
"Number of experiments to run. The code may end up running fewer "
"if `sufficient_fitness` is set. If `0`, runs indefinitely.");
ABSL_FLAG(
        RandomSeedT, random_seed, 0,
"Seed for random generator. Use `0` to not specify a seed (creates a new "
"seed each time). If running multiple experiments, this seed is set at the "
"beginning of the first experiment. Does not affect tasks.");
ABSL_FLAG(
        bool, randomize_task_seeds, false,
"If true, the data in T_search and T_select is randomized for every "
"experiment (including the first one). That is, any seeds specified in "
"the search_tasks inside the search_experiment_spec or in the "
"select_tasks are ignored. (Seeds in final_tasks are still "
"respected, however).");
ABSL_FLAG(
        std::string, select_tasks, "",
"The tasks to use in T_select. Must be a TaskCollection proto "
"in text-format. Required.");
ABSL_FLAG(
        double, sufficient_fitness, std::numeric_limits<double>::max(),
"Experimentation stops when any experiment reaches this select fitness. "
"If not specified, keeps experimenting until max_experiments is reached.");

namespace automl_zero {

    namespace {
        using ::absl::GetCurrentTimeNanos;  // NOLINT
        using ::absl::GetFlag;  // NOLINT
        using ::absl::make_unique;  // NOLINT
        using ::std::cout;  // NOLINT
        using ::std::endl;  // NOLINT
        using ::std::make_shared;  // NOLINT
        using ::std::mt19937;  // NOLINT
        using ::std::numeric_limits;  // NOLINT
        using ::std::shared_ptr;  // NOLINT
        using ::std::unique_ptr;  // NOLINT
        using ::std::vector;  // NOLINT
    }  // namespace


    double compute_complexity(shared_ptr<const Algorithm> algo){
        double algorithm_complexity = 0.0;
        algorithm_complexity = ComputeCostNew(algo->setup_) + ComputeCostNew(algo->predict_) + ComputeCostNew(algo->learn_);

        return algorithm_complexity;
    }

    void run_NSGA2(){
        // Build reusable search and select structures.
        CHECK(!GetFlag(FLAGS_search_experiment_spec).empty());
        auto experiment_spec = ParseTextFormat<SearchExperimentSpec>(
                GetFlag(FLAGS_search_experiment_spec));

        // Specify some parameters for NSGA2.
        IntegerT max_mut = 5;
        double cross_prob = 0.7;
        bool crossover = true;
        double max_complexity = 200;
        double max_error = 0.5;
        double min_complexity = 0;
        double min_error = 0;
        IntegerT population_size = experiment_spec.population_size();
        double max_error_sd_consider = 0.1;

        // Set random seed.
        RandomSeedT random_seed = GetFlag(FLAGS_random_seed);
        if (random_seed == 0) {
            random_seed = GenerateRandomSeed();
        }
        mt19937 bit_gen(random_seed);
        RandomGenerator rand_gen(&bit_gen);

        const double sufficient_error = GetFlag(FLAGS_sufficient_fitness);
        const IntegerT max_experiments = GetFlag(FLAGS_max_experiments);

        Generator generator(
                experiment_spec.initial_population(),
                experiment_spec.setup_size_init(),
                experiment_spec.predict_size_init(),
                experiment_spec.learn_size_init(),
                ExtractOps(experiment_spec.setup_ops()),
                ExtractOps(experiment_spec.predict_ops()),
                ExtractOps(experiment_spec.learn_ops()), &bit_gen,
                &rand_gen);
        unique_ptr<TrainBudget> train_budget;
        if (experiment_spec.has_train_budget()) {
            train_budget =
                    BuildTrainBudget(experiment_spec.train_budget(), &generator);
        }

        Mutator mutator(
                experiment_spec.allowed_mutation_types(),
                experiment_spec.mutate_prob(),
                ExtractOps(experiment_spec.setup_ops()),
                ExtractOps(experiment_spec.predict_ops()),
                ExtractOps(experiment_spec.learn_ops()),
                experiment_spec.mutate_setup_size_min(),
                experiment_spec.mutate_setup_size_max(),
                experiment_spec.mutate_predict_size_min(),
                experiment_spec.mutate_predict_size_max(),
                experiment_spec.mutate_learn_size_min(),
                experiment_spec.mutate_learn_size_max(),
                &bit_gen, &rand_gen);
        auto select_tasks =
                ParseTextFormat<TaskCollection>(GetFlag(FLAGS_select_tasks));

        std::cout << "max experiments: " << max_experiments << std::endl;

        // Run search experiments and select best algorithm.
        IntegerT num_experiments = 0;
        double best_select_fitness = numeric_limits<double>::lowest();
        shared_ptr<const Algorithm> best_algorithm = make_shared<const Algorithm>();
        std::vector<std::pair<std::shared_ptr<const Algorithm>, std::pair<std::vector<double>, std::vector<double>>>> pf;
        std::cout << "Random Seed: " << random_seed << std::endl;
        IntegerT feature_dim = experiment_spec.search_tasks().tasks()[0].features_size();
        const clock_t begin_time = clock();
        IntegerT first_time_feasible_soln = 0;

        double best_error;
        IntegerT first_feasible_error_found;

        while (true) {
            // Randomize T_search tasks.
            if (GetFlag(FLAGS_randomize_task_seeds)) {
                RandomizeTaskSeeds(experiment_spec.mutable_search_tasks(), 4);
            }

            // Build non-reusable search structures.
            unique_ptr<FECCache> functional_cache =
                    experiment_spec.has_fec() ?
                    make_unique<FECCache>(experiment_spec.fec()) :
                    nullptr;

            Evaluator evaluator(
                    experiment_spec.fitness_combination_mode(),
                    experiment_spec.search_tasks(),
                    &rand_gen,
                    functional_cache.get(),
                    train_budget.get(),
                    experiment_spec.max_abs_error());

            // Population size for NSGA2 should be a multiple of 4
            population_size = (population_size % 4 == 0)? population_size : (4 * static_cast<IntegerT> (population_size/4 + 1));

            NSGA2 search_algo(
                    &rand_gen, population_size,
                    experiment_spec.progress_every(),
                    &generator, &evaluator, &mutator, crossover, max_mut, cross_prob,
                    experiment_spec.mutate_setup_size_min(),
                    experiment_spec.mutate_setup_size_max(),
                    experiment_spec.mutate_predict_size_min(),
                    experiment_spec.mutate_predict_size_max(),
                    experiment_spec.mutate_learn_size_min(),
                    experiment_spec.mutate_learn_size_max(),
                    min_error,
                    min_complexity,
                    max_error,
                    max_complexity,
                    sufficient_error,
                    max_error_sd_consider);

            // Run one experiment.
            search_algo.Init();
            const IntegerT remaining_train_steps =
                    experiment_spec.max_train_steps() -
                    search_algo.NumTrainSteps();

            search_algo.Run(remaining_train_steps, kUnlimitedTime);

            // Get the pareto front.
            pf = search_algo.GetParetoFront();

            best_error = search_algo.GetBestError();
            first_feasible_error_found = search_algo.GetFirstFeasibleError();

            if(first_feasible_error_found == -1) {
                if(num_experiments == max_experiments-1){
                    first_time_feasible_soln = -1;
                }
                else {
                    first_time_feasible_soln += evaluator.GetNumEvaluations();
                }
            }
            else
                first_time_feasible_soln += first_feasible_error_found;

            std::cout << "The best error for this experiment is: " << best_error << std::endl;


            if(best_error <= sufficient_error)
                break;

            ++num_experiments;

            if(num_experiments >= max_experiments)
                break;
        }

        std::cout << "Number of evaluations required to get the first feasible error: " << first_time_feasible_soln << std::endl;
        double time_requirement = double( clock () - begin_time ) /  CLOCKS_PER_SEC;

        cout << "Experiment done. Retrieving candidate algorithm." << endl;

        // Get the final train set results.
        for(auto it = pf.begin(); it != pf.end(); it++){
            std::cout << "Error: " << it->second.first[0] << ", Std: " << it->second.first[1] << ", Complexity: " << compute_complexity(it->first) << std::endl;
        }

        // Do a final evaluation on unseen tasks.
        cout << endl;
        cout << "Final evaluation of pf algorithm "
             << "(on unseen tasks)..." << endl;
        const auto final_tasks = ParseTextFormat<TaskCollection>(GetFlag(FLAGS_final_tasks));
        mt19937 final_bit_gen(rand_gen.UniformRandomSeed());
        RandomGenerator final_rand_gen(&final_bit_gen);
        Evaluator final_evaluator(
                experiment_spec.fitness_combination_mode(),
                final_tasks,
                &final_rand_gen,
                nullptr,  // functional_cache
                nullptr,  // train_budget
                experiment_spec.max_abs_error());

        std::vector<std::pair<std::vector<double>, std::vector<double>>> test_fitness;
        std::pair<std::vector<double>, std::vector<double>> cur_fitness;

        for(auto it = pf.begin(); it != pf.end(); it++){
            cur_fitness = final_evaluator.EvaluateMulti(*(it->first));
            double algorithm_complexity = compute_complexity(it->first);
            // Provide the evaluation metrics on train and test data.
            std::cout << "Error: " << cur_fitness.first[0] << ", Complexity: " << compute_complexity(it->first)  << std::endl;
            std::cout << "Algorithm: " << (*(it->first)).ToReadable() << std::endl;
            test_fitness.push_back(cur_fitness);
            // }
        }
    }

    void run(){
        run_NSGA2();
    }
}

int main(int argc, char** argv) {
    absl::ParseCommandLine(argc, argv);
    automl_zero::run();
    return 0;
}
