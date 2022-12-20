// Ritam

#include "nsga2.h"

#include <cmath>
#include <cstdlib>
#include <iomanip>
#include <ios>
#include <memory>
#include <sstream>
#include <utility>
#include <algorithm>
#include <string>
#include <limits>
#include <fstream>
#include <iostream>
#include <stdlib.h>
#include <cstdlib>
#include <filesystem>

#include "algorithm.h"
#include "algorithm.pb.h"
#include "task_util.h"
#include "definitions.h"
#include "executor.h"
#include "instruction.h"
#include "random_generator.h"
#include "absl/flags/flag.h"
#include "absl/memory/memory.h"
#include "absl/time/clock.h"
#include "absl/time/time.h"



namespace automl_zero {

   namespace {

      using ::absl::GetCurrentTimeNanos;  // NOLINT
      using ::absl::GetFlag;  // NOLINT
      using ::absl::make_unique;  // NOLINT
      using ::absl::Seconds;  // NOLINT
      using ::std::abs;  // NOLINT
      using ::std::cout;  // NOLINT
      using ::std::endl;  // NOLINT
      using ::std::fixed;  // NOLINT
      using ::std::make_pair;  // NOLINT
      using ::std::make_shared;  // NOLINT
      using ::std::pair;  // NOLINT
      using ::std::setprecision;  // NOLINT
      using ::std::shared_ptr;  // NOLINT
      using ::std::unique_ptr;  // NOLINT
      using ::std::vector;  // NOLINT
      using ::std::move;  // NOLINT

      constexpr double kLn2 = 0.69314718056;

   }  // namespace

   void print(std::vector<std::pair<std::vector<double>, std::vector<double>>> const &input){
      for(std::pair<std::vector<double>, std::vector<double>> i: input){
         std::cout << "( " << i.first[0] << ", " << i.second[0] << " )" << std::endl;
      }
      std::cout << std::endl;
   }
 
   void print(std::vector<IntegerT> const &input){
      for(auto i: input){
         std::cout << i << ", ";
      }
      std::cout << std::endl;
   }

   double bracket(double val){
      if(val > 0)
         return val;
      else
         return 0;
   }
   
   template <class T>
   T arrange(T vec, std::vector<IntegerT> order){
      // Function to arrange a particular vector according to the provided order.
      T temp = vec;
      for(IntegerT i=0; i<order.size(); i++){
         temp[i] = vec[order[i]];
      }
      return temp;
   }

   vector<IntegerT> argsort(vector<double> nums, IntegerT order=0) {
      // Function that returns indices of a vector in a sorted order.
      // order = 1: increasing order
      // order = 2: decreasing order

      IntegerT n = nums.size();
      vector<IntegerT> indices(n);
      iota(indices.begin(), indices.end(), 0);
      if(order == 0)
         sort(indices.begin(), indices.end(), [nums](double i, double j) {return nums[i] < nums[j];});
      else
         sort(indices.begin(), indices.end(), [nums](double i, double j) {return nums[i] > nums[j];});

      return indices;
   }

   double bracket_operation(double value){
      if(value > 0)
         return value;
      else
         return 0.0;
   }

   // Main implementation of NSGA2.
   NSGA2::NSGA2(
         RandomGenerator* rand_gen, 
         const IntegerT population_size, 
         const IntegerT progress_every,
         Generator* generator, 
         Evaluator* evaluator, 
         Mutator* mutator, 
         bool crossover,
         IntegerT max_mut, 
         double cross_prob,
         IntegerT min_setup_size,
         IntegerT max_setup_size,
         IntegerT min_predict_size,
         IntegerT max_predict_size,
         IntegerT min_learn_size,
         IntegerT max_learn_size,
         double min_allowed_error,
         double min_allowed_complexity,
         double max_allowed_error,
         double max_allowed_complexity,
         double feasible_error,
         double max_error_sd_consider,
         std::string out_folder):

      evaluator_(evaluator),
      rand_gen_(rand_gen),
      start_secs_(GetCurrentTimeNanos() / kNanosPerSecond),
      epoch_secs_(start_secs_),
      epoch_secs_last_progress_(epoch_secs_),
      num_individuals_last_progress_(std::numeric_limits<IntegerT>::min()),
      progress_every_(progress_every),
      initialized_(false),
      generator_(generator),
      mutator_(mutator),
      max_mut_(max_mut),
      crossover_(crossover),
      cross_prob_(cross_prob),
      population_size_(population_size),
      population(population_size_, make_shared<Algorithm>()),
      fitness(population_size_),
      min_setup_size_(min_setup_size),
      max_setup_size_(max_setup_size),
      min_predict_size_(min_predict_size),
      max_predict_size_(max_predict_size),
      min_learn_size_(min_learn_size),
      max_learn_size_(max_learn_size),
      feasible_error_(feasible_error),
      out_folder_(out_folder),
      min_allowed_error_(min_allowed_error),
      min_allowed_complexity_(min_allowed_complexity),
      max_allowed_error_(max_allowed_error),
      max_allowed_complexity_(max_allowed_complexity),
      max_error_sd_consider_(max_error_sd_consider),
      num_individuals_(0) {
         std::cout << std::fixed << std::setprecision(4);
         crowd_dist_.assign(population_size_, 0.0);
         min_algorithm_size_ = min_setup_size_ + min_predict_size_ + min_learn_size_;
         max_algorithm_size_ = max_setup_size_ + max_predict_size_ + max_learn_size_;
         best_error_ = std::numeric_limits<double>::infinity();
         first_feasible_error_found_ = -1;
         iter_no_ = 0;
      }

   IntegerT NSGA2::Init() {
      // Function to initialize a number of population members.
      const IntegerT start_individuals = num_individuals_;
      std::vector<std::pair<std::vector<double>, std::vector<double>>>::iterator fitness_it = fitness.begin();

      for (shared_ptr<const Algorithm>& algorithm : population) {
         // Initialize the algorithm.
         InitAlgorithm(&algorithm);
         // Execute it and get the objective values.
         *fitness_it = Execute(algorithm);
         // std::cout << "fitness: " << *fitness_it << std::endl;
         std::pair<std::vector<double>, std::vector<double>> temp = *fitness_it;
         ++fitness_it;
      }
      CHECK(fitness_it == fitness.end());

      // Initialization done.
      initialized_ = true;
      return num_individuals_ - start_individuals;
   }

   IntegerT NSGA2::Run(const IntegerT max_train_steps,
         const IntegerT max_nanos) {

      // The main driver function.
      CHECK(initialized_) << "NSGA2 not initialized." << std::endl;
      const IntegerT start_nanos = GetCurrentTimeNanos();
      const IntegerT start_train_steps = evaluator_->GetNumTrainStepsCompleted();

      // Saving the data in a file to create the pf movement animation.
      std::ofstream outfile(out_folder_+"pf_animation_output.txt", std::ofstream::out);
      std::ofstream outfile_hv(out_folder_+"HV_change_exp.txt", std::ofstream::out);
      std::ofstream outfile_survival(out_folder_+"survival_exp.txt", std::ofstream::out);

      // Vectors for holding child population and fitness.
      std::vector<std::shared_ptr<const Algorithm>> child_population;
      std::vector<std::pair<std::vector<double>, std::vector<double>>> child_fitness;

      // Loop until stopping criteria are met.
      while (evaluator_->GetNumTrainStepsCompleted() - start_train_steps <
            max_train_steps &&
            GetCurrentTimeNanos() - start_nanos < max_nanos) {

         // code the NSGA2 process 
         // Clear the child population of the last generation.
         // child_population.clear();
         // child_fitness.clear();

         // // Calculate the population crowding distance which will be used for tournament selection.
         // compute_population_crowding_dist();

         // // Crossover and mutation.
         // select_cross(child_population); // parent selection + crossover 
         // child_fitness = mutation(child_population); // mutate the child solutions

         // //  Merge the parent and child population.	
         // std::vector<std::shared_ptr<const Algorithm>> merged_population(population);
         // std::vector<std::pair<double, double>> merged_fitness(fitness);

         // std::copy(child_population.begin(), child_population.end(), std::back_inserter(merged_population));
         // std::copy(child_fitness.begin(), child_fitness.end(), std::back_inserter(merged_fitness));

         //  Create the final population afrer nds and cds.
         // std::vector<IntegerT> survived_id;
         // fill_non_dominated_sort(merged_population, merged_fitness, survived_id);
         survival(child_population, child_fitness);

         //  Analyze the population and print the details.
         MaybePrintProgress(outfile);

         // find_best_algo();
         ++iter_no_;
      }

      outfile.close();
      return evaluator_->GetNumTrainStepsCompleted() - start_train_steps;
   }


   double NSGA2::compute_HV(std::vector<std::pair<std::vector<double>, std::vector<double>>>& temp_fitness,
                            std::pair<double, double> ref_point){
      std::vector<std::vector<IntegerT>> fronts = non_dominated_sorting(temp_fitness);
      std::vector<std::pair<std::vector<double>, std::vector<double>>> best_front_fitness;
      std::pair<double, double> ref_point_copy = ref_point;
      double hv_val = 0;

      for(IntegerT i:fronts[0])
         best_front_fitness.push_back(temp_fitness[i]);

       sort(best_front_fitness.begin(), best_front_fitness.end(), [](std::pair<std::vector<double>, std::vector<double>> cand_1, std::pair<std::vector<double>, std::vector<double>> cand_2){
          return (cand_1.first[0] > cand_2.first[0]);
       });
      
      for(auto cur_fitness: best_front_fitness){
         hv_val += (ref_point_copy.first - cur_fitness.first[0]) * (ref_point_copy.second - cur_fitness.second[0]);
         ref_point_copy.first = cur_fitness.first[0];
      }

      return hv_val;
   }

   void NSGA2::survival(std::vector<std::shared_ptr<const Algorithm>> &child_population,
                        std::vector<std::pair<std::vector<double>, std::vector<double>>> &child_fitness){
      
      child_population.clear();
      child_fitness.clear();

      if(crossover_){
         // Calculate the population crowding distance which will be used for tournament selection.
         compute_population_crowding_dist();
         select_cross(child_population);
      }
      else{
         child_population = population;
      }

      child_fitness = mutation(child_population); // perform mutation
      std::vector<IntegerT> survived_id;

      // //  Merge the parent and child population.	
      std::vector<std::shared_ptr<const Algorithm>> merged_population(population);
      std::vector<std::pair<std::vector<double>, std::vector<double>>> merged_fitness(fitness);

      std::copy(child_population.begin(), child_population.end(), std::back_inserter(merged_population));
      std::copy(child_fitness.begin(), child_fitness.end(), std::back_inserter(merged_fitness));

      //  Create the final population afrer nds and cds.
      fill_non_dominated_sort(merged_population, merged_fitness, survived_id);

      // Count survived children.
      IntegerT count_survived_children = 0;
      for(IntegerT i: survived_id){
         if(i >= population.size())
            ++count_survived_children;
      }
      double survived_frac = (double)count_survived_children/merged_population.size();

      std::string hv_file, survive_file;
      
      if(crossover_){
         hv_file = out_folder_+"/hv_exp_cross_mut.txt";
         survive_file = out_folder_+"/survival_exp_cross_mut.txt";
      }
      else{
         hv_file = out_folder_+"/hv_exp_mut.txt";
         survive_file = out_folder_+"/survival_exp_mut.txt";
      }


      if (iter_no_ == 0){
         std::ofstream outfile_hv(hv_file, std::ios_base::out);
         std::ofstream outfile_survival(survive_file, std::ios_base::out);   
      }
      std::ofstream outfile_hv(hv_file, std::ios_base::app);
      std::ofstream outfile_survival(survive_file, std::ios_base::app);

      outfile_hv << evaluator_->GetNumTrainStepsCompleted() << "," << compute_HV(merged_fitness, std::pair<double, double>(501, 1.1)) << std::endl;
      outfile_survival << evaluator_->GetNumTrainStepsCompleted() << "," << survived_frac << std::endl; 

      // check if a better error is found.
      for(std::pair<std::vector<double>, std::vector<double>> temp_fitness: fitness){
         if(temp_fitness.first[0] < best_error_){
            best_error_ = temp_fitness.first[0];
            if((first_feasible_error_found_ == -1) && (best_error_ < feasible_error_))
               first_feasible_error_found_ = evaluator_->GetNumEvaluations();
         }
      }
   }

   IntegerT NSGA2::GetFirstFeasibleError(){
      return first_feasible_error_found_;
   }

   double NSGA2::GetBestError(){
      return best_error_;
   }


   void NSGA2::select_cross(std::vector<std::shared_ptr<const Algorithm>>& child_pop){

      // Function to perform parent selection and crossover.
      if(cross_prob_ == 0){
         // Break if there's zero prob of crossover
         child_pop = population;
         child_pop = population;
         return;
      }

      // Lists for holding parent indices.
      std::vector<IntegerT> idx_list_1, idx_list_2;
      for(IntegerT i=0; i<population_size_; i++){
         // Populate the lists with all the possible indices.
         idx_list_1.push_back(i);
         idx_list_2.push_back(i);
      }
      // Randomly shuffle the parent indices.
      std::random_shuffle(idx_list_1.begin(), idx_list_1.end());
      std::random_shuffle(idx_list_2.begin(), idx_list_2.end());

      // Initialize resulting child solutions. 
      std::shared_ptr<Algorithm> child_1, child_2;
      child_1 = make_shared<Algorithm>(generator_->TheInitModel());
      child_2 = make_shared<Algorithm>(generator_->TheInitModel()); 

      // Index of the parents.
      IntegerT parent_1, parent_2;

      for(IntegerT i=0; i<population_size_; i+=4){
         // Selection-based crossover.
         parent_1 = tournament_selection(idx_list_1[i], idx_list_1[i+1]);
         parent_2 = tournament_selection(idx_list_1[i+2], idx_list_1[i+3]);
         crossover(population[parent_1], population[parent_2], child_1, child_2);
         child_pop.push_back(child_1);
         child_pop.push_back(child_2);

         parent_1 = tournament_selection(idx_list_2[i], idx_list_2[i+1]);
         parent_2 = tournament_selection(idx_list_2[i+2], idx_list_2[i+3]);
         crossover(population[parent_1], population[parent_2], child_1, child_2);
         child_pop.push_back(child_1);
         child_pop.push_back(child_2);
      }
   }

   std::vector<std::pair<std::vector<double>, std::vector<double>>> NSGA2::mutation(
         std::vector<std::shared_ptr<const Algorithm>>& child_pop){
      // mutation function
      std::vector<std::pair<std::vector<double>, std::vector<double>>> child_fitness;
      double min_child_error = std::numeric_limits<double>::infinity();
      for(IntegerT count = 0; count < child_pop.size(); count++){
         // Mutate every child population member.
         std::shared_ptr<const Algorithm> temp_child = child_pop[count];
         mutator_->Mutate(max_mut_, &temp_child);

         // Set effective instructions
         auto mutated = make_unique<Algorithm>(*temp_child);
         (mutated.get())->SetEffectiveInstructions();
         (&temp_child)->reset(mutated.release());

         child_pop[count] = temp_child;
         std::pair<std::vector<double>, std::vector<double>> cur_fitness = Execute(child_pop[count]);
         if(cur_fitness.first[0] < min_child_error){
            min_child_error = cur_fitness.first[0];
         }
         child_fitness.push_back(cur_fitness);
      }

      return child_fitness;
   }

   void NSGA2::fill_non_dominated_sort (
         std::vector<std::shared_ptr<const Algorithm>> temp_population,
         std::vector<std::pair<std::vector<double>, std::vector<double>>> temp_fitness,
         std::vector<IntegerT> &survived_id){

      // Fill the population with the non-dominated fronts.
      std::vector<std::vector<std::shared_ptr<const Algorithm>>> pf;
      std::vector<std::pair<std::vector<double>, std::vector<double>>> pf_fitness;

      std::vector<std::shared_ptr<const Algorithm>> final_population, temp_pop;
      std::vector<std::pair<std::vector<double>, std::vector<double>>> final_fitness, temp_fit;

      temp_pop = temp_population;
      temp_fit = temp_fitness;

      // Get the fronts fron non-dominated sorting.
      std::vector<std::vector<IntegerT>> fronts = non_dominated_sorting(temp_fitness);

      // Takes care of the front rank.
      IntegerT pf_index = 0;

      do{
         if(fronts[pf_index].size() + final_population.size() < population_size_){
            // If we can add the entire front to the population, we are adding.
            for(IntegerT i=0; i < fronts[pf_index].size(); i++){
               final_population.push_back(temp_population[fronts[pf_index][i]]);
               final_fitness.push_back(temp_fitness[fronts[pf_index][i]]);
               survived_id.push_back(fronts[pf_index][i]);
            }
         }
         else{
            // If we can't add the entire front, we sort the front
            // according to crowding distance and add the top solutions
            // till we reach the required population size.
            IntegerT rem_count = population_size_ - final_population.size();
            
            std::vector<std::pair<std::vector<double>, std::vector<double>>> cur_pf_fitness;
            for(IntegerT i=0; i<fronts[pf_index].size(); i++){
               cur_pf_fitness.push_back(temp_fitness[fronts[pf_index][i]]);
            }

            // Get the indices in crowding disance sorted fashion and 
            // arrange the front accordingly.
            vector<IntegerT> index_list = crowding_dist_sort(cur_pf_fitness);
            fronts[pf_index] = arrange<std::vector<IntegerT>>(fronts[pf_index], index_list);

            // Add the top rem_count number of solutions from the front.
            for(IntegerT i=0; i<rem_count; i++){
               final_population.push_back(temp_population[fronts[pf_index][i]]);
               final_fitness.push_back(temp_fitness[fronts[pf_index][i]]);	
               survived_id.push_back(fronts[pf_index][i]);
            }
         }

         // Increment the pareto front rank.
         ++pf_index;
      }while(final_population.size() != population_size_);
      
      // Update the population and fitness with the current values.
      population = final_population;
      fitness = final_fitness;
   }

   std::vector<std::vector<IntegerT>> NSGA2::non_dominated_sorting(
                           std::vector<std::pair<std::vector<double>, 
                           std::vector<double>>> temp_fitness){
      // Function to perform the non-dominated sorting. 
      bool flag;

      // Keeps track of whether a population member has been included to a front.
      std::vector<bool> include(temp_fitness.size(), false);

      // Contains the population indices in different fronts.
      std::vector<std::vector<IntegerT>> pf_index;

      // Pf indices of a particular front.
      std::vector<IntegerT> cur_pf_index;

      do{
         // At each iteration, extract a non-dominated front.
         cur_pf_index.clear();

         for(IntegerT i=0; i<temp_fitness.size(); i++){
            if(!include[i]){
               flag = false;

               for(IntegerT j=0; j<temp_fitness.size(); j++){
                  if(!include[j]){
                     IntegerT domination_output = check_dominance(temp_fitness[i], temp_fitness[j]);
                     if(domination_output == -1){
                        // ith solution is dominated by jth solution.
                        flag = true;
                        break;
                     }
                  }
               }

               if(!flag){
                  // ith solution is non-dominated.
                  cur_pf_index.push_back(i);
               }
            }
         }

         for(IntegerT k=0; k<cur_pf_index.size(); k++){
            // Make the include signal of all the current pareto front members true.
            include[cur_pf_index[k]] = true; 
         }

         pf_index.push_back(cur_pf_index);
      }while(std::accumulate(include.begin(), include.end(), 0) != temp_fitness.size());

      // Return the pareto fronts filled with population member indices.
      return pf_index;
   }

   void NSGA2::compute_population_crowding_dist(){
      // Get the fronts fron non-dominated sorting.
      // Required for tournament selection while choosing parents.
      std::vector<std::vector<IntegerT>> fronts = non_dominated_sorting(fitness);
      std::vector<std::pair<std::vector<double>, std::vector<double>>> cur_pf_fitness;
      std::vector<double> dist;

      for(IntegerT pf_index=0; pf_index < fronts.size(); pf_index++){
         cur_pf_fitness.clear();
         dist.clear();

         // Collect the fitness values of the current front.
         for(IntegerT i=0; i<fronts[pf_index].size(); i++){
               cur_pf_fitness.push_back(fitness[fronts[pf_index][i]]);
         }

         // Get the crowding distance for the current front.
         dist = crowding_dist_calc(fitness);

         // Update the global crowding distance.
         for(IntegerT i=0; i<fronts[pf_index].size(); i++){
               crowd_dist_[fronts[pf_index][i]] = dist[i];
         }
      }

   }

   vector<IntegerT> NSGA2::crowding_dist_sort(std::vector<std::pair<std::vector<double>, std::vector<double>>> temp_fitness, 
                                             bool set_dist){
      
      std::vector<IntegerT> sorted_idx_dist;
      std::vector<double> dist = crowding_dist_calc(temp_fitness);
      sorted_idx_dist = argsort(dist, 1);

      return sorted_idx_dist;
   }

   std::vector<double> NSGA2::crowding_dist_calc(std::vector<std::pair<std::vector<double>, std::vector<double>>> temp_fitness){
      // Function to sort population based on the crowding distance.
      std::vector<IntegerT> sorted_idx_1, sorted_idx_2;
      std::vector<double> obj_1, obj_2, sorted_obj_1, sorted_obj_2;
      std::vector<double> dist(temp_fitness.size(), 0);	// dist will hold the crowding distances for every population member

      for(int i=0; i < temp_fitness.size(); i++){
         // Collect all the objective values.
         obj_1.push_back(temp_fitness[i].first[0]);
         obj_2.push_back(temp_fitness[i].second[0]);
      }

      // Find the population order according to both the objectives.
      sorted_idx_1 = argsort(obj_1);
      sorted_idx_2 = argsort(obj_2);

      sorted_obj_1 = obj_1;
      sorted_obj_2 = obj_2;

      sort(sorted_obj_1.begin(), sorted_obj_1.end());
      sort(sorted_obj_2.begin(), sorted_obj_2.end());

      // The extreme ends get infinity distance.
      dist[sorted_idx_1[0]] += std::numeric_limits<double>::infinity();
      dist[sorted_idx_1[sorted_idx_1.size()-1]] += std::numeric_limits<double>::infinity();
      dist[sorted_idx_2[0]] += std::numeric_limits<double>::infinity();
      dist[sorted_idx_2[sorted_idx_2.size()-1]] += std::numeric_limits<double>::infinity();

      // Find min and max of the objective scores for normalization.
      double min_obj_1 = *min_element(obj_1.begin(), obj_1.end());
      double max_obj_1 = *max_element(obj_1.begin(), obj_1.end());
      double min_obj_2 = *min_element(obj_2.begin(), obj_2.end());
      double max_obj_2 = *max_element(obj_2.begin(), obj_2.end());

      // Add the objective-wise distances to the dist vector.
      double dist_obj;
      for(int i=1; i<dist.size()-1; i++){
         if(max_obj_1 - min_obj_1 != 0){
            dist_obj = fabs(obj_1[sorted_idx_1[i+1]]- obj_1[sorted_idx_1[i-1]]);
            if(dist_obj == std::numeric_limits<double>::infinity())
               dist[sorted_idx_1[i]] = std::numeric_limits<double>::infinity();
            else
               // Normalize the obj values.
               dist[sorted_idx_1[i]] += dist_obj/(max_obj_1 - min_obj_1);
         }
         if(max_obj_2 - min_obj_2 != 0){
            dist_obj = fabs(obj_2[sorted_idx_2[i+1]]- obj_2[sorted_idx_2[i-1]]);
            if(dist_obj == std::numeric_limits<double>::infinity())
               dist[sorted_idx_2[i]] = std::numeric_limits<double>::infinity();
            else
               // Normalize the obj values.
               dist[sorted_idx_2[i]] += dist_obj/(max_obj_2 - min_obj_2);
         }
            
      }

      // Sort the population in decreasing order of crowding distance
      for(int i=0; i<dist.size(); i++){
         if (dist[i] != std::numeric_limits<double>::infinity())
            dist[i] /= 2;
      }

      return dist;
   }


   IntegerT NSGA2::  compare_complexity(std::vector<double> first_option, 
                              std::vector<double> second_option){
      
      return compare_lexicographic_complexity(first_option, second_option);

      }

   IntegerT NSGA2::  compare_lexicographic_complexity(std::vector<double> first_option, 
                              std::vector<double> second_option){
      
      if (first_option[0] < second_option[0])
         return 1;
      else if(first_option[1] > second_option[1])
         return -1;
      else{
         if (first_option[1] < second_option[1])
            return 1;
         else if(first_option[1] > second_option[1])
            return -1;
         else{
            if (first_option[2] < second_option[2])
               return 1;
            else if(first_option[2] > second_option[2])
               return -1;
            else{
                  if (first_option[3] < second_option[3])
                     return 1;
                  else if(first_option[3] > second_option[3])
                     return -1;
                  else
                     return 0;
               }
               
         }
      }

      }

   IntegerT NSGA2::compare_normal_complexity(std::vector<double> first_option,
                  std::vector<double> second_option){
      
      if (first_option[3] < second_option[3])
         return 1;
      else if(first_option[3] > second_option[3])
         return -1;
      return 0;

      }


   IntegerT NSGA2::check_dominance(std::pair<std::vector<double>, std::vector<double>> fitness_1, 
                                 std::pair<std::vector<double>, std::vector<double>> fitness_2){
      // function to check the dominance status between two fitnesses
      // returns 1 if first fitness dominates the second one
      // returns -1 if second fitness dominates the first one
      // returns 0 if the two fitnesses are completely equal

      double cv_1 = bracket(fitness_1.second[0] - max_allowed_complexity_) + bracket(fitness_1.first[0] - max_allowed_error_) + bracket(min_allowed_complexity_ - fitness_1.second[0]) + bracket(min_allowed_error_ - fitness_1.first[0]);
      double cv_2 = bracket(fitness_2.second[0] - max_allowed_complexity_) + bracket(fitness_2.first[0] - max_allowed_error_) + bracket(min_allowed_complexity_ - fitness_2.second[0]) + bracket(min_allowed_error_ - fitness_2.first[0]);
      IntegerT complexity_comparison = compare_complexity(fitness_1.second, fitness_2.second);
      // std::cout << "CV 1: " << cv_1 << " CV 2: " << cv_2 << std::endl;

      if (cv_1 == 0 && cv_2 == 0){
         // when both are feasible
         if(fitness_1.first[0] < fitness_2.first[0]){
            if(complexity_comparison == 1 || complexity_comparison == 0)
               return 1;
            else
               return 0;

         }
         else if(fitness_1.first[0] == fitness_2.first[0]){
            return complexity_comparison;
         }
         else{
            if(complexity_comparison == -1 || complexity_comparison == 0)
               return -1;
            else
               return 0;
         }
      }

      else if(cv_1==0 && cv_2>0){
         // index 1 is feasible, but 2 is not
         return 1;
      }
      else if(cv_1>0 && cv_2==0){
         // index 2 is feasible, but 1 is not
         return -1;
      }
      else{
         // both are infeasible
         if(cv_1 == cv_2)
            return 0;
         else if(cv_1 < cv_2)
            return 1;
         else  
            return -1;
      }

   }

   IntegerT NSGA2::tournament_selection(IntegerT option_1, IntegerT option_2){
      // perform tournament selection for parent selection
      int flag = check_dominance(fitness[option_1], fitness[option_2]);
      if(flag == 1)	return option_1;
      else if(flag == -1)	return option_2;
      else{
         if(crowd_dist_[option_1] > crowd_dist_[option_2])return option_1;
         else if(crowd_dist_[option_1] < crowd_dist_[option_2]) return option_2;
         else{
            float r = static_cast <float> (std::rand()) / static_cast <float> (RAND_MAX);
            if(r < 0.5) return option_1;
            else return option_2;
         }
      }
   }

   void NSGA2::cross_modules(std::shared_ptr<const Algorithm> parent_1,
         std::shared_ptr<const Algorithm> parent_2,
         std::shared_ptr<Algorithm>& child_1,
         std::shared_ptr<Algorithm>& child_2,
         std::string module){
         
         child_1 = make_shared<Algorithm>(generator_->TheInitModel());
         child_2 = make_shared<Algorithm>(generator_->TheInitModel());

         // Initialize child_1 and child_2 to parent_1 and parent_2, respectively.
         child_1->setup_ = std::move(parent_1->setup_);
         child_2->setup_ = std::move(parent_2->setup_);
         child_1->learn_ = std::move(parent_1->learn_);
         child_2->learn_ = std::move(parent_2->learn_);
         child_1->predict_ = std::move(parent_1->predict_);
         child_2->predict_ = std::move(parent_2->predict_);

         // Check if the parents are compatible for crossover.
         // bool compatible = check_crossover_compatibility(parent_1, parent_2, module);


         // if(compatible){
            // Only exchange the selected module and if size does not exceed the requirement.
         if(module == "setup"){
            child_1->setup_ = std::move(parent_2->setup_);
            child_2->setup_ = std::move(parent_1->setup_);
         }

         else if(module == "predict"){
            child_1->predict_ = std::move(parent_2->predict_);
            child_2->predict_ = std::move(parent_1->predict_);
         }

         else if(module == "learn"){
            child_1->learn_ = std::move(parent_2->learn_);
            child_2->learn_ = std::move(parent_1->learn_);
         }
         // }

   }

   // void NSGA2::crossover(std::shared_ptr<const Algorithm> parent_1,
   //       std::shared_ptr<const Algorithm> parent_2,
   //       std::shared_ptr<Algorithm>& child_1,
   //       std::shared_ptr<Algorithm>& child_2){
   //    // Function to perform crossover.

   //    // Three modules of algorithms.
   //    std::vector<std::string> modules{"setup", "predict", "learn"};

   //    // Random number generation for comparing with probability.
   //    double p = static_cast <float> (std::rand()) / static_cast <float> (RAND_MAX);

   //    // Probabilisitically perform the crossover.
   //    if(p < cross_prob_){
   //       std::vector<std::shared_ptr<Algorithm>> child_algorithms(6);
   //       std::vector<std::pair<std::vector<double>, std::vector<double>>> child_fitnesses(6);

   //       cross_modules(parent_1, parent_2, child_algorithms[0], child_algorithms[1], "setup");
   //       cross_modules(parent_1, parent_2, child_algorithms[2], child_algorithms[3], "predict");
   //       cross_modules(parent_1, parent_2, child_algorithms[4], child_algorithms[5], "learn");
   //       // cross_modules(parent_1, parent_2, child_algorithms[6], child_algorithms[7], "");

   //       for(IntegerT i=0; i<6; i++){
   //          child_fitnesses[i] = Execute(child_algorithms[i]);
   //       }

   //       auto fronts = non_dominated_sorting(child_fitnesses);
   //       // print(fronts[0]);
   //       if(fronts[0].size() >= 2){
   //          // [TODO] Choose the extreme solutions 
   //          child_1 = child_algorithms[fronts[0][0]];
   //          child_2 = child_algorithms[fronts[0][1]];
   //       }
   //       else{
   //          // [TODO] Take another one at random
   //          child_1 = child_algorithms[fronts[0][0]];
   //          child_2 = child_algorithms[fronts[1][0]];
   //       }
   //    }

   //    return;
   // }

   void NSGA2::crossover(std::shared_ptr<const Algorithm> parent_1,
         std::shared_ptr<const Algorithm> parent_2,
         std::shared_ptr<Algorithm>& child_1,
         std::shared_ptr<Algorithm>& child_2){
      // Function to perform crossover.

      // Three modules of algorithms.
      std::vector<std::string> modules{"setup", "predict", "learn"};

      // Random number generation for comparing with probability.
      double p = static_cast <float> (std::rand()) / static_cast <float> (RAND_MAX);

      // Initialize child_1 and child_2 to parent_1 and parent_2, respectively.
      child_1->setup_ = std::move(parent_1->setup_);
      child_2->setup_ = std::move(parent_2->setup_);
      child_1->learn_ = std::move(parent_1->learn_);
      child_2->learn_ = std::move(parent_2->learn_);
      child_1->predict_ = std::move(parent_1->predict_);
      child_2->predict_ = std::move(parent_2->predict_);

      // Probabilisitically perform the crossover.
      if(p < cross_prob_){
         IntegerT rand_module_idx = std::rand() % modules.size();

         // Check if the parents are compatible for crossover.
         bool compatible = check_crossover_compatibility(parent_1, parent_2, modules[rand_module_idx]);

         if(compatible){
            // Only exchange the selected module and if size does not exceed the requirement.
            if(modules[rand_module_idx] == "setup"){
               child_1->setup_ = std::move(parent_2->setup_);
               child_2->setup_ = std::move(parent_1->setup_);
            }

            else if(modules[rand_module_idx] == "predict"){
               child_1->predict_ = std::move(parent_2->predict_);
               child_2->predict_ = std::move(parent_1->predict_);
            }

            else if(modules[rand_module_idx] == "learn"){
               child_1->learn_ = std::move(parent_2->learn_);
               child_2->learn_ = std::move(parent_1->learn_);
            }

            else{
               std::cerr << "Unknown component type" << std::endl;
               std::exit(EXIT_FAILURE);
            }
         }
      }

      return;
   }

   bool NSGA2::check_crossover_compatibility(std::shared_ptr<const Algorithm> parent_1, 
                                        std::shared_ptr<const Algorithm> parent_2,
                                        std::string component){

      bool check_1, check_2;
      IntegerT child_1_size, child_2_size;

      if(component == "setup"){
         // Compute the sizes of the children.
         child_1_size = parent_2->setup_.size() + parent_1->predict_.size()  + parent_1->learn_.size(); 
         child_2_size = parent_1->setup_.size() + parent_2->predict_.size()  + parent_2->learn_.size(); 
      }

      else if(component == "predict"){
         // Compute the sizes of the children.
         child_1_size = parent_1->setup_.size() + parent_2->predict_.size()  + parent_1->learn_.size(); 
         child_2_size = parent_2->setup_.size() + parent_1->predict_.size()  + parent_2->learn_.size(); 
      }

      else if(component == "learn"){
         // Compute the sizes of the children.
         child_1_size = parent_1->setup_.size() + parent_1->predict_.size()  + parent_2->learn_.size(); 
         child_2_size = parent_2->setup_.size() + parent_2->predict_.size()  + parent_1->learn_.size(); 
      }

      else{
         std::cerr << "Unknown component type" << std::endl;
         std::exit(EXIT_FAILURE);
      }

      // Check if both the children are of proper size.
      check_1 = (child_1_size >= min_algorithm_size_) && (child_1_size <= max_algorithm_size_);
      check_2 = (child_2_size >= min_algorithm_size_) && (child_2_size <= max_algorithm_size_);

      return (check_1 && check_2);
   }

   IntegerT NSGA2::NumIndividuals() const {
      return num_individuals_;
   }

   IntegerT NSGA2::PopulationSize() const {
      return population_size_;
   }

   IntegerT NSGA2::NumTrainSteps() const {
      return evaluator_->GetNumTrainStepsCompleted();
   }

   void NSGA2::PopulationStats(
         double* error_mean, double* error_stdev, double* best_error,
         double* complexity_mean, double* complexity_stdev, double* best_complexity) const {

      // Function to display the statistics of the population.
      double error_mean_temp = 0.0;
      double complexity_mean_temp = 0.0;
      double total_squares_error = 0.0;
      double total_squares_complexity = 0.0;
      double best_error_temp = std::numeric_limits<double>::infinity();
      double best_complexity_temp = std::numeric_limits<double>::infinity();

      //  IntegerT best_index = -1;
      for (IntegerT index = 0; index < population_size_; ++index) {
         if(fitness[index].first[0] < best_error_temp)	best_error_temp = fitness[index].first[0];
         if(fitness[index].second[0] < best_complexity_temp)	best_complexity_temp = fitness[index].second[0];
         const double complexity_double = static_cast<double>(fitness[index].second[0]);
         const double error_double = static_cast<double>(fitness[index].first[0]);
         complexity_mean_temp += complexity_double;
         error_mean_temp += error_double;
         total_squares_complexity += complexity_double * complexity_double;
         total_squares_error += error_double * error_double;
      }

      double size = static_cast<double>(population_size_);
      complexity_mean_temp /= size;
      error_mean_temp /= size;

      *error_mean = static_cast<double>(error_mean_temp);
      *complexity_mean = static_cast<double>(complexity_mean_temp);

      double var_error = total_squares_error / size - error_mean_temp * error_mean_temp;
      double var_complexity = total_squares_complexity / size - complexity_mean_temp * complexity_mean_temp;

      if (var_error < 0.0) var_error = 0.0;
      if (var_complexity < 0.0) var_complexity = 0.0;

      *error_stdev = static_cast<double>(sqrt(var_error));
      *complexity_stdev = static_cast<double>(sqrt(var_complexity));

      *best_error = static_cast<double>(best_error_temp);
      *best_complexity = static_cast<double>(best_complexity_temp);
   }

   void NSGA2::InitAlgorithm(
         shared_ptr<const Algorithm>* algorithm) {
      *algorithm = make_shared<Algorithm>(generator_->TheInitModel());
      mutator_->Mutate(0, algorithm);

      // Set effective instructions
      auto mutated = make_unique<Algorithm>(**algorithm);
      (mutated.get())->SetEffectiveInstructions();
      algorithm->reset(mutated.release());
   }

   std::pair<std::vector<double>, std::vector<double>> NSGA2::Execute(shared_ptr<const Algorithm> algorithm) {
      // Executes a single algorithm and return the fitness.
      ++num_individuals_;
      epoch_secs_ = GetCurrentTimeNanos() / kNanosPerSecond;
      // std::cout << algorithm->ToReadable() << std::endl;
      std::pair<std::vector<double>, std::vector<double>> fitness_temp = evaluator_->EvaluateMulti(*algorithm);
      return fitness_temp;
   }

   void NSGA2::MaybePrintProgress(std::ofstream &outfile) {
      if (num_individuals_ < num_individuals_last_progress_ + progress_every_) {
         return;
      }
      num_individuals_last_progress_ = num_individuals_;
      double error_mean, error_stdev, best_error, complexity_mean, complexity_std, best_complexity;
      //  shared_ptr<const Algorithm> pop_best_algorithm;
      PopulationStats(
            &error_mean, &error_stdev, &best_error, &complexity_mean, &complexity_std, &best_complexity);
      std::cout << "indivs=" << num_individuals_ << ", " << setprecision(0) << fixed
         << "elapsed_secs=" << epoch_secs_ - start_secs_ << ", "
         << "error: mean=" << setprecision(6) << fixed << error_mean << ", "
         << "stdev=" << setprecision(6) << fixed << error_stdev << ", "
         << "best value=" << setprecision(6) << fixed << best_error << "; "
         << "complexity: mean=" << setprecision(6) << fixed << complexity_mean << ", "
         << "stdev=" << setprecision(6) << fixed << complexity_std << ", "
         << "best value=" << setprecision(6) << fixed << best_complexity << ", "
         << std::endl;

        for(int i =0; i<population_size_; i++){
      	  outfile << fitness[i].first[0] << ", " << fitness[i].second[0] << ", ";
      	  if(i == population_size_ - 1)
      		  outfile << fitness[i].first[0] << ", " << fitness[i].second[0];
        }
      // outfile << ", " << std::accumulate(crowd_dist_.begin(), crowd_dist_.end(), 0.0, [](double sum, double val){ return (val != std::numeric_limits<double>::infinity())?(sum+val):sum;});
      outfile << std::endl;

      std::cout.flush();
   }

   std::vector<std::pair<std::shared_ptr<const Algorithm>, std::pair<std::vector<double>, std::vector<double>>>> NSGA2::GetParetoFront(){
      // Function to return the pareto front.
      std::vector<std::vector<IntegerT>> pf_ind = non_dominated_sorting(fitness);
      std::vector<std::pair<std::shared_ptr<const Algorithm>, std::pair<std::vector<double>, std::vector<double>>>> pf_comb;

      for (int i=0; i<pf_ind[0].size(); i++){
         pf_comb.push_back(std::make_pair (population[pf_ind[0][i]], fitness[pf_ind[0][i]]));
      }

      return pf_comb;
   }

}  // namespace automl_zero
