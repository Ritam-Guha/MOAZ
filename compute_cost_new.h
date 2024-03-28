// Wei Ao

#ifndef AUTOML_ZERO_COMPUTE_COST_NEW_H_
#define AUTOML_ZERO_COMPUTE_COST_NEW_H_

#include "instruction.h"

namespace automl_zero {

// Returns the cost of train a model in "compute-units". Compute-units are an
// arbitrary unit of compute cost, to compare across instructions and
// component functions. The only requirement on compute units is that they must
// be (roughly) proportional to time.

double ComputeCostNew(
    const std::vector<std::shared_ptr<const Instruction>>& component_function);

double ComputeCostNew(const Instruction& instruction);

}  // namespace automl_zero

#endif  // AUTOML_ZERO_COMPUTE_COST_H_