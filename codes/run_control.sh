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
# ./run_rl.sh <seed>
seed=$1

bazel run --sandbox_debug -c opt \
  --copt=-DMAX_SCALAR_ADDRESSES=4 \
  --copt=-DMAX_VECTOR_ADDRESSES=3 \
  --copt=-DMAX_MATRIX_ADDRESSES=1 \
  :run_search_experiment -- \
  --search_experiment_spec=" \
    search_tasks { \
      tasks { \
        classic_control_task {} \
        features_size: 4 \
        num_train_examples: 100 \
        num_valid_examples: 100 \
        num_tasks: 1 \
        eval_type: RMS_ERROR \
      } \
    } \
    setup_ops: [SCALAR_CONST_SET_OP, VECTOR_INNER_PRODUCT_OP, SCALAR_DIFF_OP, SCALAR_PRODUCT_OP, SCALAR_VECTOR_PRODUCT_OP, VECTOR_SUM_OP] \
    predict_ops: [SCALAR_CONST_SET_OP, VECTOR_INNER_PRODUCT_OP, SCALAR_DIFF_OP, SCALAR_PRODUCT_OP, SCALAR_VECTOR_PRODUCT_OP, VECTOR_SUM_OP, SCALAR_DIVISION_OP, SCALAR_ABS_OP, SCALAR_SIN_OP, SCALAR_COS_OP, SCALAR_MIN_OP, SCALAR_EXP_OP, SCALAR_LOG_OP, SCALAR_HEAVYSIDE_OP, SCALAR_BROADCAST_OP]\
    learn_ops: [SCALAR_CONST_SET_OP,VECTOR_INNER_PRODUCT_OP, SCALAR_DIFF_OP, SCALAR_PRODUCT_OP, SCALAR_VECTOR_PRODUCT_OP, VECTOR_SUM_OP] \
    setup_size_init: 10 \
    mutate_setup_size_min: 1 \
    mutate_setup_size_max: 20 \
    predict_size_init: 10 \
    mutate_predict_size_min: 1 \
    mutate_predict_size_max: 20 \
    learn_size_init: 10 \
    mutate_learn_size_min: 1 \
    mutate_learn_size_max: 20 \
    fec {num_train_examples: 10 num_valid_examples: 10} \
    fitness_combination_mode: MULTI_OBJECTIVE \
    population_size: 100 \
    tournament_size: 10 \
    initial_population: RANDOM_ALGORITHM \
    max_train_steps: 200000 \
    allowed_mutation_types {
      mutation_types: [ALTER_PARAM_MUTATION_TYPE, RANDOMIZE_COMPONENT_FUNCTION_MUTATION_TYPE, INSERT_INSTRUCTION_MUTATION_TYPE, REMOVE_INSTRUCTION_MUTATION_TYPE] \
      } \
    mutate_prob: 0.9 \
    progress_every: 1000 \
    " \
  --final_tasks=" \
    tasks { \
      classic_control_task {} \
      features_size: 4 \
      num_train_examples: 100 \
      num_valid_examples: 1 \
      num_tasks: 100 \
      eval_type: RMS_ERROR \
      data_seeds: [1000000] \
      param_seeds: [2000000] \
    } \
    " \
  --max_experiments=10 \
  --random_seed=$seed \
  --select_tasks=" \
    tasks { \
      classic_control_task {} \
      features_size: 4 \
      num_train_examples: 100 \
      num_valid_examples: 1 \
      num_tasks: 100 \
      eval_type: RMS_ERROR \
    } \
    " \
  --sufficient_fitness=0.2