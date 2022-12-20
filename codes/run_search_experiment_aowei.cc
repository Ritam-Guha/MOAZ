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
#include <fstream>


#include "algorithm.h"
#include "task_util.h"
#include "task.pb.h"
#include "definitions.h"
#include "instruction.pb.h"
#include "evaluator.h"
#include "experiment.pb.h"
#include "experiment_util.h"
#include "fec_cache.h"
#include "generator.h"
#include "mutator.h"
#include "random_generator.h"
#include "regularized_evolution.h"
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
    IntegerT, max_experiments, 1,
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
using ::std::ofstream;
using ::std::ifstream;
using ::std::streampos;
using ::std::ios;

}  // namespace

void run() {
  // Set random seed.
  RandomSeedT random_seed = GetFlag(FLAGS_random_seed);
  if (random_seed == 0) {
    random_seed = GenerateRandomSeed();
  }
  mt19937 bit_gen(random_seed);
  RandomGenerator rand_gen(&bit_gen);
  cout << "Random seed = " << random_seed << endl;

  // Build reusable search and select structures.
  CHECK(!GetFlag(FLAGS_search_experiment_spec).empty());
  auto experiment_spec = ParseTextFormat<SearchExperimentSpec>(
      GetFlag(FLAGS_search_experiment_spec));
  const double sufficient_fitness = GetFlag(FLAGS_sufficient_fitness);
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

  // Run search experiments and select best algorithm.
  IntegerT num_experiments = 0;
  double best_select_fitness = numeric_limits<double>::lowest();
  shared_ptr<const Algorithm> best_algorithm = make_shared<const Algorithm>();
    
  while (true) {
    // Randomize T_search tasks.
    if (GetFlag(FLAGS_randomize_task_seeds)) {
      RandomizeTaskSeeds(experiment_spec.mutable_search_tasks(),
                            rand_gen.UniformRandomSeed());
    }

    // Build non-reusable search structures.
    unique_ptr<FECCache> functional_cache =
        experiment_spec.has_fec() ?
            make_unique<FECCache>(experiment_spec.fec()) :
            nullptr;
    Evaluator evaluator(
        experiment_spec.fitness_combination_mode(),
        experiment_spec.search_tasks(),
        &rand_gen, functional_cache.get(), train_budget.get(),
        experiment_spec.max_abs_error());
    RegularizedEvolution regularized_evolution(
        &rand_gen, experiment_spec.population_size(),
        experiment_spec.tournament_size(),
        experiment_spec.progress_every(),
        &generator, &evaluator, &mutator);

    // Run one experiment.
    cout << "Running evolution experiment (on the T_search tasks)..." << endl;
    regularized_evolution.Init();
    const IntegerT remaining_train_steps =
        experiment_spec.max_train_steps() -
        regularized_evolution.NumTrainSteps();
    regularized_evolution.Run(remaining_train_steps, kUnlimitedTime);
    cout << "Experiment done. Retrieving candidate algorithm." << endl;

    // Extract best algorithm based on T_search.
    double unused_pop_mean, unused_pop_stdev, search_fitness;
    shared_ptr<const Algorithm> candidate_algorithm =
        make_shared<const Algorithm>();
    regularized_evolution.PopulationStats(
        &unused_pop_mean, &unused_pop_stdev,
        &candidate_algorithm, &search_fitness);
    cout << "Search fitness for candidate algorithm = "
         << search_fitness << endl;

    // Randomize T_select tasks.
    if (GetFlag(FLAGS_randomize_task_seeds)) {
      RandomizeTaskSeeds(&select_tasks, rand_gen.UniformRandomSeed());
    }
    mt19937 select_bit_gen(rand_gen.UniformRandomSeed());
    RandomGenerator select_rand_gen(&select_bit_gen);

    // Keep track of the best model on the T_select tasks.
    cout << "Evaluating candidate algorithm from experiment "
         << "(on T_select tasks)... " << endl;
    Evaluator select_evaluator(
        MEAN_FITNESS_COMBINATION,
        select_tasks,
        &select_rand_gen,
        nullptr,  // functional_cache
        nullptr,  // train_budget
        experiment_spec.max_abs_error());
    const double select_fitness =
        select_evaluator.Evaluate(*candidate_algorithm);
    cout << "Select fitness for candidate algorithm = "
         << select_fitness << endl;
    if (select_fitness >= best_select_fitness) {
      best_select_fitness = select_fitness;
      best_algorithm = candidate_algorithm;
      cout << "Select fitness is the best so far. " << endl;
    }

    // Consider stopping experiments.
    if (sufficient_fitness > 0.0 &&
        best_select_fitness > sufficient_fitness) {
      // Stop if we reached the specified `sufficient_fitness`.
      break;
    }
    ++num_experiments;
    if (max_experiments != 0 && num_experiments >= max_experiments) {
      // Stop if we reached the maximum number of experiments.
      break;
    }
  }

  // Do a final evaluation on unseen tasks.
  cout << endl;
  cout << "Final evaluation of best algorithm "
       << "(on unseen tasks)..." << endl;
  const auto final_tasks =
      ParseTextFormat<TaskCollection>(GetFlag(FLAGS_final_tasks));
  mt19937 final_bit_gen(rand_gen.UniformRandomSeed());
  RandomGenerator final_rand_gen(&final_bit_gen);
  Evaluator final_evaluator(
      MEAN_FITNESS_COMBINATION,
      final_tasks,
      &final_rand_gen,
      nullptr,  // functional_cache
      nullptr,  // train_budget
      experiment_spec.max_abs_error());
  const double final_fitness =
      final_evaluator.Evaluate(*best_algorithm);

  cout << "Final evaluation fitness (on unseen data) = "
       << final_fitness << endl;
  cout << "Algorithm found: " << endl
       << best_algorithm->ToReadable() << endl;
  
  // Write the best algorithm to a txt file (Wei Ao, oct 11, 2021)
  ofstream out_txt("/Users/aowei/XcodeProjects/automl_zero/results/found_algorithm.txt", ios::ate);
  if (out_txt.is_open()){
    cout << endl << "Write algorithms to a txt file..." << endl;
    out_txt << best_algorithm->ToReadable() << endl;
    out_txt.close();
    cout << "Wrtting txt done!" << endl;
  }
  else cout << "Cannot write algorithms to a txt file!" << endl;
      
  // Write the best algorithm to a proto file (Wei Ao, oct 11, 2021)
  ofstream out_proto("/Users/aowei/XcodeProjects/automl_zero/results/found_algorithm.proto", ios::binary|ios::out);
  SerializedAlgorithm algorithm_proto = best_algorithm->ToProto();
  if (out_proto.is_open()){
    cout << endl << "Write algorithms to a proto file..." << endl;
    out_proto.write(reinterpret_cast<char*>(&algorithm_proto), sizeof(algorithm_proto));
    out_proto.close();
    cout << "Wrtting proto done!" << endl;
  }
  else cout << "Cannot write algorithms to a proto file!" << endl;
    
  // Reload algorithms from proto files (Wei Ao, nov 16, 2021)
  shared_ptr<Algorithm> algorithm_from_proto = make_shared<Algorithm>();
  cout << endl << "Algorithm before loading: " << endl << algorithm_from_proto->ToReadable() << endl;
  SerializedAlgorithm* algorithm_proto_load = new SerializedAlgorithm;
  ifstream in_proto("/Users/aowei/XcodeProjects/automl_zero/results/found_algorithm.proto", ios::binary|ios::in);
  if (in_proto.is_open()){
      cout << endl << "Read algorithm from a proto file..." << endl;
      in_proto.read((char*)algorithm_proto_load, sizeof(SerializedAlgorithm));
      in_proto.close();
      algorithm_from_proto->FromProto(*algorithm_proto_load);
      cout << "Loading proto done!" << endl;
      cout << "Algorithm after loading: " << endl << algorithm_from_proto->ToReadable() << endl;
  }
  else cout << "Connot load the proto file to algorithms!" << endl;
  double from_proto_fitness = final_evaluator.Evaluate(*algorithm_from_proto);
  cout << "The evaluation fitnescs of algorithm loaded from proto file (on unseen data) = " << from_proto_fitness << endl;

  cout << endl << "Done." << endl;
    
}

}  // namespace automl_zero

int main(int argc, char** argv) {
  absl::ParseCommandLine(argc, argv);
  automl_zero::run();
  return 0;
}
