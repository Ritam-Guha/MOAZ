# Copyright 2021 The Google Research Authors.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

#!/bin/bash

# Usage:
# ./run_demo.sh <seed>  (set seed to 0 to get a randomly selected seed)

seed=$1
features=$2

bazel run --sandbox_debug -c opt \
  --copt=-DMAX_SCALAR_ADDRESSES=4 \
  --copt=-DMAX_VECTOR_ADDRESSES=3 \
  --copt=-DMAX_MATRIX_ADDRESSES=1 \
  --cxxopt='-std=c++17' \
  :run_search_experiment_nsga2 -- \
  --search_experiment_spec=" \
    search_tasks { \
      tasks { \
        scalar_linear_regression_task {} \
        features_size: $features \
        num_train_examples: 1000 \
        num_valid_examples: 100 \
        num_tasks: 10 \
        eval_type: RMS_ERROR \
      } \
    } \
    setup_ops: [SCALAR_CONST_SET_OP, VECTOR_INNER_PRODUCT_OP, SCALAR_DIFF_OP, SCALAR_PRODUCT_OP, SCALAR_VECTOR_PRODUCT_OP, VECTOR_SUM_OP] \
    predict_ops: [SCALAR_CONST_SET_OP, VECTOR_INNER_PRODUCT_OP, SCALAR_DIFF_OP, SCALAR_PRODUCT_OP, SCALAR_VECTOR_PRODUCT_OP, VECTOR_SUM_OP] \
    learn_ops: [SCALAR_CONST_SET_OP, VECTOR_INNER_PRODUCT_OP, SCALAR_DIFF_OP, SCALAR_PRODUCT_OP, SCALAR_VECTOR_PRODUCT_OP, VECTOR_SUM_OP] \
    learn_size_init: 8 \
    setup_size_init: 10 \
    predict_size_init: 2 \
    fec {num_train_examples: 10 num_valid_examples: 10} \
    fitness_combination_mode: MULTI_OBJECTIVE \
    population_size: 30 \
    tournament_size: 10 \
    initial_population: RANDOM_ALGORITHM \
    max_train_steps: 200000000 \
    allowed_mutation_types {
      mutation_types: [ALTER_PARAM_MUTATION_TYPE,  INSERT_INSTRUCTION_MUTATION_TYPE, REMOVE_INSTRUCTION_MUTATION_TYPE]
      } \
    mutate_setup_size_min : 5\
    mutate_setup_size_max : 11\
    mutate_predict_size_min : 5\
    mutate_predict_size_max : 11\
    mutate_learn_size_min : 5\
    mutate_learn_size_max : 11\
    mutate_prob: 1 \
    progress_every: 10000 \
    " \
  --final_tasks=" \
    tasks { \
      scalar_linear_regression_task {} \
      features_size: $features \
      num_train_examples: 1000 \
      num_valid_examples: 100 \
      num_tasks: 10 \
      eval_type: RMS_ERROR \
      data_seeds: [1000000] \
      param_seeds: [2000000] \
    } \
    " \
  --max_experiments=10 \
  --randomize_task_seeds \
  --random_seed=$seed \
  --select_tasks=" \
    tasks { \
      scalar_linear_regression_task {} \
      features_size: $features \
      num_train_examples: 1000 \
      num_valid_examples: 100 \
      num_tasks: 100 \
      eval_type: RMS_ERROR \
    } \
    " \
  --sufficient_fitness=0.1
