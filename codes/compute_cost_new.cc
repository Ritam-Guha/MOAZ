// Wei Ao

#include "compute_cost_new.h"

#include "instruction.pb.h"
#include "algorithm.h"

// need to define vector size and matrix size based on real-used definition
#define VSize 4.0
#define MSize 4.0

namespace automl_zero {

double ComputeCostNew(
    const std::vector<std::shared_ptr<const Instruction>>& component_function) {
  double cost = 0.0;
  for (const std::shared_ptr<const Instruction>& instruction :
       component_function) {
    cost += ComputeCostNew(*instruction);
  }
  return cost;
}

// Return Number of FLOPs

double ComputeCostNew(const Instruction& instruction) {
  switch (instruction.op_) {
    case NO_OP:
      return 0.0;
    case SCALAR_SUM_OP:
      return 1.0;
    case SCALAR_DIFF_OP:
      return 1.0;
    case SCALAR_PRODUCT_OP:
      return 1.0;
    case SCALAR_DIVISION_OP:
      return 1.0;
    case SCALAR_MIN_OP:
      return 1.0;
    case SCALAR_MAX_OP:
      return 1.0;
    case SCALAR_ABS_OP:
      return 1.0;
    case SCALAR_HEAVYSIDE_OP:
      return 1.0;
    case SCALAR_CONST_SET_OP:
      return 1.0;
    case SCALAR_SIN_OP:
      return 1.0;
    case SCALAR_COS_OP:
      return 1.0;
    case SCALAR_TAN_OP:
      return 1.0;
    case SCALAR_ARCSIN_OP:
      return 1.0;
    case SCALAR_ARCCOS_OP:
      return 1.0;
    case SCALAR_ARCTAN_OP:
      return 1.0;
    case SCALAR_EXP_OP:
      return 1.0;
    case SCALAR_LOG_OP:
      return 1.0;
    case VECTOR_SUM_OP:
      return VSize;
    case VECTOR_DIFF_OP:
      return VSize;
    case VECTOR_PRODUCT_OP:
      return 2*VSize;
    case VECTOR_DIVISION_OP:
      return VSize;
    case VECTOR_MIN_OP:
      return VSize;
    case VECTOR_MAX_OP:
      return VSize;
    case VECTOR_ABS_OP:
      return VSize;
    case VECTOR_HEAVYSIDE_OP:
      return VSize;
    case VECTOR_CONST_SET_OP:
      return VSize;
    case MATRIX_SUM_OP:
      return MSize;
    case MATRIX_DIFF_OP:
      return MSize;
    case MATRIX_PRODUCT_OP:
      return MSize*MSize;
    case MATRIX_DIVISION_OP:
      return MSize;
    case MATRIX_MIN_OP:
      return MSize;
    case MATRIX_MAX_OP:
      return MSize;
    case MATRIX_ABS_OP:
      return MSize;
    case MATRIX_HEAVYSIDE_OP:
      return MSize;
    case MATRIX_CONST_SET_OP:
      return MSize;
    case SCALAR_VECTOR_PRODUCT_OP:
      return VSize;
    case VECTOR_INNER_PRODUCT_OP:
      return 2*VSize;
    case VECTOR_OUTER_PRODUCT_OP:
      return VSize*VSize;
    case SCALAR_MATRIX_PRODUCT_OP:
      return MSize*MSize;
    case MATRIX_VECTOR_PRODUCT_OP:
      return MSize*MSize;
    case VECTOR_NORM_OP:
      return 2*VSize;
    case MATRIX_NORM_OP:
      return MSize*MSize;
    case MATRIX_TRANSPOSE_OP:
      return MSize;
    case MATRIX_MATRIX_PRODUCT_OP:
      return MSize*MSize;
    case VECTOR_MEAN_OP:
      return MSize*MSize;
    case VECTOR_ST_DEV_OP:
      return MSize*MSize;
    case MATRIX_MEAN_OP:
      return MSize*MSize;
    case MATRIX_ST_DEV_OP:
      return MSize*MSize;
    case MATRIX_ROW_MEAN_OP:
      return MSize;
    case MATRIX_ROW_ST_DEV_OP:
      return MSize;
    case SCALAR_GAUSSIAN_SET_OP:
      return 1.0;
    case VECTOR_GAUSSIAN_SET_OP:
      return VSize;
    case MATRIX_GAUSSIAN_SET_OP:
      return MSize*MSize;
    case SCALAR_UNIFORM_SET_OP:
      return 1.0;
    case VECTOR_UNIFORM_SET_OP:
      return VSize;
    case MATRIX_UNIFORM_SET_OP:
      return MSize*MSize;
    case SCALAR_RECIPROCAL_OP:
      return 1.0;
    case SCALAR_BROADCAST_OP:
      return 1.0;
    case VECTOR_RECIPROCAL_OP:
      return VSize;
    case MATRIX_RECIPROCAL_OP:
      return MSize*MSize;
    case MATRIX_ROW_NORM_OP:
      return MSize;
    case MATRIX_COLUMN_NORM_OP:
      return MSize;
    case VECTOR_COLUMN_BROADCAST_OP:
      return VSize;
    case VECTOR_ROW_BROADCAST_OP:
      return VSize;
    // Do not add default clause. All ops should be supported here.
  }
}

}  // namespace automl_zero