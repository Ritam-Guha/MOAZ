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

#include "compute_cost.h"

#include "instruction.pb.h"
#include "algorithm.h"

namespace automl_zero {


double ComputeCost(
    const std::vector<std::shared_ptr<const Instruction>>& component_function) {
  std::map<Op, double> cost_map = ComputeCost();
  double min_cost=std::numeric_limits<double>::infinity();
  double max_cost=-1.0;

  for(auto it=cost_map.begin(); it!=cost_map.end(); ++it){
    min_cost = std::min(min_cost, it->second);
    max_cost = std::max(max_cost, it->second);
  }

  // std::cout << "Min Cost: " << min_cost << ", Max Cost: " << max_cost << std::endl;

  double cost = 0.0;
  for (const std::shared_ptr<const Instruction>& instruction :
       component_function) {
        //  std::cout << cost_map[instruction->op_] << std::endl;
        // double cur_cost = (cost_map[instruction->op_] - min_cost) / (max_cost - min_cost);
        double cur_cost = cost_map[instruction->op_];
        cost += cur_cost;
  }

  return cost;
}

// To add a new op compute cost here, first run ops_benchmark.cc. Then,
// calculate the normalization ratio for your new costs:
//
// ratio = MATRIX_BETA_SET_OP cost in this file / your MATRIX_BETA_SET_OP cost
//
// Multiply each of your ops costs by this ratio to determine their new
// normalized costs, which can be added here.
std::map<Op, double> ComputeCost() {
  // std::vector<double> instruction_cost = {3013921.0, 4703759.0, 5102027.0,4418347.0,3963916.0,3677265.0,4573695.0,3684352.0,4057075.0,3691108.0,7538523.0,7452807.0,7583203.0,9145616.0,7673039.0,9273978.0,11755929.0,11627725.0,4701519.0,4165747.0,4504555.0,4556237.0,3989956.0,3974229.0,3713533.0,3965743.0,3991421.0,5579381.0,5429452.0,5475227.0,18234378.0,5457728.0,5840952.0,4630926.0,6728311.0,3693035.0,3705015.0,4294617.0,9833707.0,5986302.0,9310002.0,4810562.0,6422746.0,9394756.0,14516296.0,4280443.0,5585730.0,4595196.0,10640216.0,9763956.0,16766477.0,20775635.0,77483018.0,277690384.0,26610704.0,57817372.0,208339446.0,4212086.0,4165814.0,6311851.0,24336141.0,13351123.0,6682187.0,10993088.0,11087322.0};
  std::map<Op, double> map_cost;

  map_cost.insert({SCALAR_SUM_OP, 4703759.0});
  map_cost.insert({SCALAR_DIFF_OP, 5102027.0});
  map_cost.insert({SCALAR_PRODUCT_OP, 4418347.0});
  map_cost.insert({SCALAR_DIVISION_OP, 3963916.0});
  map_cost.insert({SCALAR_MIN_OP, 3677265.0});
  map_cost.insert({SCALAR_MAX_OP, 4573695.0});
  map_cost.insert({SCALAR_ABS_OP, 3684352.0});
  map_cost.insert({SCALAR_HEAVYSIDE_OP, 4057075.0});
  map_cost.insert({SCALAR_CONST_SET_OP, 3691108.0});
  map_cost.insert({SCALAR_SIN_OP, 7538523.0});
  map_cost.insert({SCALAR_COS_OP, 7452807.0});
  map_cost.insert({SCALAR_TAN_OP, 7583203.0});
  map_cost.insert({SCALAR_ARCSIN_OP, 9145616.0});
  map_cost.insert({SCALAR_ARCCOS_OP, 7673039.0});
  map_cost.insert({SCALAR_ARCTAN_OP, 9273978.0});
  map_cost.insert({SCALAR_EXP_OP, 11755929.0});
  map_cost.insert({SCALAR_LOG_OP, 11627725.0});
  map_cost.insert({VECTOR_SUM_OP, 4701519.0});
  map_cost.insert({VECTOR_DIFF_OP, 4165747.0});
  map_cost.insert({VECTOR_PRODUCT_OP, 4504555.0});
  map_cost.insert({VECTOR_DIVISION_OP, 4556237.0});
  map_cost.insert({VECTOR_MIN_OP, 3989956.0});
  map_cost.insert({VECTOR_MAX_OP, 3974229.0});
  map_cost.insert({VECTOR_ABS_OP, 3713533.0});
  map_cost.insert({VECTOR_HEAVYSIDE_OP, 3965743.0});
  map_cost.insert({VECTOR_CONST_SET_OP, 3991421.0});
  map_cost.insert({MATRIX_SUM_OP, 5579381.0});
  map_cost.insert({MATRIX_DIFF_OP, 5429452.0});
  map_cost.insert({MATRIX_PRODUCT_OP, 5475227.0});
  map_cost.insert({MATRIX_DIVISION_OP, 18234378.0});
  map_cost.insert({MATRIX_MIN_OP, 5457728.0});
  map_cost.insert({MATRIX_MAX_OP, 5840952.0});
  map_cost.insert({MATRIX_ABS_OP, 4630926.0});
  map_cost.insert({MATRIX_HEAVYSIDE_OP, 6728311.0});
  map_cost.insert({MATRIX_CONST_SET_OP, 3693035.0});
  map_cost.insert({SCALAR_VECTOR_PRODUCT_OP, 3705015.0});
  map_cost.insert({VECTOR_INNER_PRODUCT_OP, 4294617.0});
  map_cost.insert({VECTOR_OUTER_PRODUCT_OP, 9833707.0});
  map_cost.insert({SCALAR_MATRIX_PRODUCT_OP, 5986302.0});
  map_cost.insert({MATRIX_VECTOR_PRODUCT_OP, 9310002.0});
  map_cost.insert({VECTOR_NORM_OP, 4810562.0});
  map_cost.insert({MATRIX_NORM_OP, 6422746.0});
  map_cost.insert({MATRIX_TRANSPOSE_OP, 9394756.0});
  map_cost.insert({MATRIX_MATRIX_PRODUCT_OP, 14516296.0});
  map_cost.insert({VECTOR_MEAN_OP, 4280443.0});
  map_cost.insert({VECTOR_ST_DEV_OP, 5585730.0});
  map_cost.insert({MATRIX_MEAN_OP, 4595196.0});
  map_cost.insert({MATRIX_ST_DEV_OP, 10640216.0});
  map_cost.insert({MATRIX_ROW_MEAN_OP, 9763956.0});
  map_cost.insert({MATRIX_ROW_ST_DEV_OP, 16766477.0});
  map_cost.insert({SCALAR_GAUSSIAN_SET_OP, 20775635.0});
  map_cost.insert({VECTOR_GAUSSIAN_SET_OP, 77483018.0});
  map_cost.insert({MATRIX_GAUSSIAN_SET_OP, 277690384.0});
  map_cost.insert({SCALAR_UNIFORM_SET_OP, 26610704.0});
  map_cost.insert({VECTOR_UNIFORM_SET_OP, 57817372.0});
  map_cost.insert({MATRIX_UNIFORM_SET_OP, 208339446.0});
  map_cost.insert({SCALAR_RECIPROCAL_OP, 4212086.0});
  map_cost.insert({SCALAR_BROADCAST_OP, 4165814.0});
  map_cost.insert({VECTOR_RECIPROCAL_OP, 6311851.0});
  map_cost.insert({MATRIX_RECIPROCAL_OP, 24336141.0});
  map_cost.insert({MATRIX_ROW_NORM_OP, 13351123.0});
  map_cost.insert({MATRIX_COLUMN_NORM_OP, 6682187.0});
  map_cost.insert({VECTOR_COLUMN_BROADCAST_OP, 10993088.0});
  map_cost.insert({VECTOR_ROW_BROADCAST_OP, 11087322.0});

  // auto min_cost = std::min_element(map_cost.begin(), map_cost.end(),
  // [](const std::pair<Op, double>& p1, const std::pair<Op, double>& p2) {
  // return p1.second < p2.second; });

  // auto max_cost = std::max_element(map_cost.begin(), map_cost.end(),
  // [](const std::pair<Op, double>& p1, const std::pair<Op, double>& p2) {
  // return p1.second > p2.second; });

  return map_cost;

  // switch (instruction.op_) {
  //   case NO_OP:
  //     return 3013921.0;
  //   case SCALAR_SUM_OP:
  //     return 4703759.0;
  //   case SCALAR_DIFF_OP:
  //     return 5102027.0;
  //   case SCALAR_PRODUCT_OP:
  //     return 4418347.0;
  //   case SCALAR_DIVISION_OP:
  //     return 3963916.0;
  //   case SCALAR_MIN_OP:
  //     return 3677265.0;
  //   case SCALAR_MAX_OP:
  //     return 4573695.0;
  //   case SCALAR_ABS_OP:
  //     return 3684352.0;
  //   case SCALAR_HEAVYSIDE_OP:
  //     return 4057075.0;
  //   case SCALAR_CONST_SET_OP:
  //     return 3691108.0;
  //   case SCALAR_SIN_OP:
  //     return 7538523.0;
  //   case SCALAR_COS_OP:
  //     return 7452807.0;
  //   case SCALAR_TAN_OP:
  //     return 7583203.0;
  //   case SCALAR_ARCSIN_OP:
  //     return 9145616.0;
  //   case SCALAR_ARCCOS_OP:
  //     return 7673039.0;
  //   case SCALAR_ARCTAN_OP:
  //     return 9273978.0;
  //   case SCALAR_EXP_OP:
  //     return 11755929.0;
  //   case SCALAR_LOG_OP:
  //     return 11627725.0;
  //   case VECTOR_SUM_OP:
  //     return 4701519.0;
  //   case VECTOR_DIFF_OP:
  //     return 4165747.0;
  //   case VECTOR_PRODUCT_OP:
  //     return 4504555.0;
  //   case VECTOR_DIVISION_OP:
  //     return 4556237.0;
  //   case VECTOR_MIN_OP:
  //     return 3989956.0;
  //   case VECTOR_MAX_OP:
  //     return 3974229.0;
  //   case VECTOR_ABS_OP:
  //     return 3713533.0;
  //   case VECTOR_HEAVYSIDE_OP:
  //     return 3965743.0;
  //   case VECTOR_CONST_SET_OP:
  //     return 3991421.0;
  //   case MATRIX_SUM_OP:
  //     return 5579381.0;
  //   case MATRIX_DIFF_OP:
  //     return 5429452.0;
  //   case MATRIX_PRODUCT_OP:
  //     return 5475227.0;
  //   case MATRIX_DIVISION_OP:
  //     return 18234378.0;
  //   case MATRIX_MIN_OP:
  //     return 5457728.0;
  //   case MATRIX_MAX_OP:
  //     return 5840952.0;
  //   case MATRIX_ABS_OP:
  //     return 4630926.0;
  //   case MATRIX_HEAVYSIDE_OP:
  //     return 6728311.0;
  //   case MATRIX_CONST_SET_OP:
  //     return 3693035.0;
  //   case SCALAR_VECTOR_PRODUCT_OP:
  //     return 3705015.0;
  //   case VECTOR_INNER_PRODUCT_OP:
  //     return 4294617.0;
  //   case VECTOR_OUTER_PRODUCT_OP:
  //     return 9833707.0;
  //   case SCALAR_MATRIX_PRODUCT_OP:
  //     return 5986302.0;
  //   case MATRIX_VECTOR_PRODUCT_OP:
  //     return 9310002.0;
  //   case VECTOR_NORM_OP:
  //     return 4810562.0;
  //   case MATRIX_NORM_OP:
  //     return 6422746.0;
  //   case MATRIX_TRANSPOSE_OP:
  //     return 9394756.0;
  //   case MATRIX_MATRIX_PRODUCT_OP:
  //     return 14516296.0;
  //   case VECTOR_MEAN_OP:
  //     return 4280443.0;
  //   case VECTOR_ST_DEV_OP:
  //     return 5585730.0;
  //   case MATRIX_MEAN_OP:
  //     return 4595196.0;
  //   case MATRIX_ST_DEV_OP:
  //     return 10640216.0;
  //   case MATRIX_ROW_MEAN_OP:
  //     return 9763956.0;
  //   case MATRIX_ROW_ST_DEV_OP:
  //     return 16766477.0;
  //   case SCALAR_GAUSSIAN_SET_OP:
  //     return 20775635.0;
  //   case VECTOR_GAUSSIAN_SET_OP:
  //     return 77483018.0;
  //   case MATRIX_GAUSSIAN_SET_OP:
  //     return 277690384.0;
  //   case SCALAR_UNIFORM_SET_OP:
  //     return 26610704.0;
  //   case VECTOR_UNIFORM_SET_OP:
  //     return 57817372.0;
  //   case MATRIX_UNIFORM_SET_OP:
  //     return 208339446.0;
  //   case SCALAR_RECIPROCAL_OP:
  //     return 4212086.0;
  //   case SCALAR_BROADCAST_OP:
  //     return 4165814.0;
  //   case VECTOR_RECIPROCAL_OP:
  //     return 6311851.0;
  //   case MATRIX_RECIPROCAL_OP:
  //     return 24336141.0;
  //   case MATRIX_ROW_NORM_OP:
  //     return 13351123.0;
  //   case MATRIX_COLUMN_NORM_OP:
  //     return 6682187.0;
  //   case VECTOR_COLUMN_BROADCAST_OP:
  //     return 10993088.0;
  //   case VECTOR_ROW_BROADCAST_OP:
  //     return 11087322.0;
    // Do not add default clause. All ops should be supported here.
  }

}  // namespace automl_zero
