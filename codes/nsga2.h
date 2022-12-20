// Ritam 

#ifndef AUTOML_ZERO_NSGA2_H_
#define AUTOML_ZERO_NSGA2_H_

#include <memory>
#include <string>
#include <unordered_set>
#include <utility>
#include <vector>
#include <iostream>
#include <fstream>

#include "nsga2.h"
#include "algorithm.h"
#include "definitions.h"
#include "evaluator.h"
#include "generator.h"
#include "mutator.h"
#include "random_generator.h"
#include "absl/flags/flag.h"
#include "absl/time/time.h"
#include "gtest/gtest_prod.h"

namespace automl_zero {

class NSGA2 {
    public:
        NSGA2(
            // The compute cost of evaluating one individual.
            RandomGenerator* rand_gen,
            // Runs up to this many total individuals.
            IntegerT population_size,
            // How frequently to print progress reports.
            IntegerT progress_every,
            Generator* generator,
            Evaluator* evaluator,
            // The mutator to use to perform all mutations.
            Mutator* mutator,
            // whether to do crossover
            bool crossover,
            // Maximum number of mutations for a solution.
            IntegerT max_mut_,
            // Crossover probability.
            double cross_prob,
            // Min and max sizes of the components.
            IntegerT min_setup_size,
            IntegerT max_setup_size,
            IntegerT min_predict_size,
            IntegerT max_predict_size,
            IntegerT min_learn_size,
            IntegerT max_learn_size,
            // constraints on the objectives.
            double min_allowed_error,
            double min_allowed_complexity,
            double max_allowed_error,
            double max_allowed_complexity,
            double feasible_error,
            double max_sd_error_consider,
            // Name of the folder holding the outputs. 
            // Done because bazel does not allow to create a file in the environment.
            std::string output_folder);

        NSGA2(const NSGA2& other) = delete;

        NSGA2& operator=(const NSGA2& other) = delete;

        // Initializes the algorithm. Returns the number of individuals evaluated in
        // this call.
        IntegerT Init();

        // Runs for a given amount of time (rounded up to the nearest generation) or
        // for a certain number of train steps (rounded up to the nearest generation),
        // whichever is first. Assumes that Init has been called. Returns the number
        // of train steps executed in this call.
        IntegerT Run(IntegerT max_train_steps, IntegerT max_nanos);

        // Returns the CUs/number of individuals evaluated so far. Returns an exact
        // number.
        IntegerT NumIndividuals() const;

        // The number of train steps executed.
        IntegerT NumTrainSteps() const;

        // Get the best error found and when it was found.
        IntegerT GetFirstFeasibleError();
        double GetBestError();

        // Returns the best serialized Algorithm in the population and its worker
        // fitness.
        IntegerT PopulationSize() const;

        // Returns the pareto front .
        std::vector<std::pair<std::shared_ptr<const Algorithm>, std::pair<std::vector<double>, std::vector<double>>>> GetParetoFront();
        
        // Displays the statistics of the current population.
        void PopulationStats(double* error_mean, double* error_stdev, double* best_error,
                    double* complexity_mean, double* complexity_stdev, double* best_complexity) const;

    private:
        // Used for testing. Don't know well.
        FRIEND_TEST(NSGA2Test, TimesCorrectly);

        friend IntegerT PutsInPosition(
            const Algorithm&, NSGA2*);
        friend IntegerT EvaluatesAndPutsInPosition(
            const Algorithm&, NSGA2*);
        friend bool PopulationsEq(
            const NSGA2&,
            const NSGA2&);

        // Initalize a single algorithm.
        void InitAlgorithm(std::shared_ptr<const Algorithm>* algorithm);

        // Executes an algorithm and returns the pair (complexity, error).
        std::pair<std::vector<double>, std::vector<double>> Execute(std::shared_ptr<const Algorithm> algorithm);

        // Prints the progress after every progress_every function evaluations.
        void MaybePrintProgress(std::ofstream &file);

        // NSGA2 specific functions //
        // Perform parent selection and crossover for the population.
        void select_cross(std::vector<std::shared_ptr<const Algorithm>>& child_pop);

        // Perform crossover between parent_1 and parent_2.
        void crossover(std::shared_ptr<const Algorithm> parent_1, 
                        std::shared_ptr<const Algorithm> parent_2, 
                        std::shared_ptr<Algorithm>& child_1, 
                        std::shared_ptr<Algorithm>& child_2);

        // Check the crossover compatibility of two parent solutions
        // in terms of their length after crossover.
        // Only eligible for one component crossover.
        bool check_crossover_compatibility(std::shared_ptr<const Algorithm> parent_1, 
                                        std::shared_ptr<const Algorithm> parent_2,
                                        std::string component);

        // Replace the old population with the new non-dominated population.
        void fill_non_dominated_sort (std::vector<std::shared_ptr<const Algorithm>> temp_population,
                    std::vector<std::pair<std::vector<double>, std::vector<double>>> temp_fitness,
                    std::vector<IntegerT>& survived_id);       

        // Perform tournament selection between two parents and return the index of the selected parent.  
        IntegerT tournament_selection(IntegerT option_1, IntegerT option_2);

        // Mutate the child population.
        std::vector<std::pair<std::vector<double>, std::vector<double>>> mutation(std::vector<std::shared_ptr<const Algorithm>>& child_pop);

        // Check domination of one solution wrt the other based on the objective scores.
        IntegerT check_dominance(std::pair<std::vector<double>, std::vector<double>> fitness_1, std::pair<std::vector<double>, std::vector<double>> fitness_2);

        // Non-dominated sorting operation.
        std::vector<std::vector<IntegerT>> non_dominated_sorting(std::vector<std::pair<std::vector<double>, std::vector<double>>> temp_fitness);

        // Crowding distance sorting.
        std::vector<IntegerT> crowding_dist_sort(std::vector<std::pair<std::vector<double>, std::vector<double>>> temp_fitness, bool set_dist=false);

        // Calculates crowding distance.
        std::vector<double> crowding_dist_calc(std::vector<std::pair<std::vector<double>, std::vector<double>>> temp_fitness);

        // Calculates crowding distance for the original population.
        void compute_population_crowding_dist();

        // Function to check the survival prob of cross-mut vs mut
        void survival(std::vector<std::shared_ptr<const Algorithm>> &child_population,
                        std::vector<std::pair<std::vector<double>, std::vector<double>>> &child_fitness);

        // Function to compute the Hypervolume.
        double compute_HV(std::vector<std::pair<std::vector<double>, std::vector<double>>>& temp_fitness, std::pair<double, double> ref_point);
        
        // Function to check the better one in terms of complexity in lexicographic fashion.
        IntegerT compare_complexity(std::vector<double> first_option, 
                              std::vector<double> second_option);

        // Function to check the better one in terms of complexity in lexicographic fashion.
        IntegerT compare_lexicographic_complexity(std::vector<double> first_option, 
                              std::vector<double> second_option);

        // Function to check the better one in terms of complexity in lexicographic fashion.
        IntegerT compare_normal_complexity(std::vector<double> first_option, 
                              std::vector<double> second_option);

        // Function to cross modules.
        void cross_modules(std::shared_ptr<const Algorithm> parent_1,
         std::shared_ptr<const Algorithm> parent_2,
         std::shared_ptr<Algorithm>& child_1,
         std::shared_ptr<Algorithm>& child_2,
         std::string module);

        // private data members.
        Evaluator* evaluator_;
        RandomGenerator* rand_gen_;
        const IntegerT start_secs_;
        IntegerT epoch_secs_;
        IntegerT epoch_secs_last_progress_;
        IntegerT num_individuals_last_progress_;
        const IntegerT progress_every_;
        bool initialized_;
        bool crossover_;
        Generator* generator_;
        Mutator* mutator_;
        const IntegerT max_mut_;
        const double cross_prob_;
        std::string out_folder_;
        std::vector<double> crowd_dist_;

        // Size of the components.
        IntegerT min_setup_size_;
        IntegerT max_setup_size_;
        IntegerT min_predict_size_;
        IntegerT max_predict_size_;
        IntegerT min_learn_size_;
        IntegerT max_learn_size_;
        IntegerT min_algorithm_size_;
        IntegerT max_algorithm_size_;

        IntegerT iter_no_;
        double best_error_;
        double feasible_error_;
        IntegerT first_feasible_error_found_;

        // Constraints on the objectives.
        double max_allowed_error_;
        double max_allowed_complexity_;
        double min_allowed_error_;
        double min_allowed_complexity_;
        double max_error_sd_consider_;

        // Serializable components.
        const IntegerT population_size_;
        std::vector<std::shared_ptr<const Algorithm>> population;
        std::vector<std::pair<std::vector<double>, std::vector<double>>> fitness;
        IntegerT num_individuals_;
    };

}  // namespace automl_zero

#endif  // AUTOML_ZERO_NSGA2_H_
