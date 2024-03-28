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

#ifndef AUTOML_ZERO_ALGORITHM_H_
#define AUTOML_ZERO_ALGORITHM_H_

#include <array>
#include <cstdint>
#include <memory>
#include <ostream>

#include "algorithm.pb.h"
#include "instruction.h"
#include "absl/flags/flag.h"

namespace automl_zero {

   struct memTime;//avoid forward declaration

   class RandomGenerator;

   // Denotes one of the three component functions in the Algorithm.
   enum ComponentFunctionT : IntegerT {
      kSetupComponentFunction = 0,
      kPredictComponentFunction = 1,
      kLearnComponentFunction = 2
   };

   // The Algorithm describing an individual.
   // NOTE: the default constructor does NOT serve as a way to initialize the
   // Instruction.
   class Algorithm {
      public:
         // A Algorithm without any instructions.
         Algorithm() {}

         explicit Algorithm(const SerializedAlgorithm& checkpoint_algorithm);

         Algorithm(const Algorithm& other);
         Algorithm& operator=(const Algorithm& other);
         Algorithm(Algorithm&& other);
         Algorithm& operator=(Algorithm&& other);

         bool operator ==(const Algorithm& other) const;
         bool operator !=(const Algorithm& other) const {
            return !(*this == other);
         }

         // Returns a human-readable representation.
         std::string ToReadable() const;
         std::string ToReadableEffective() const;

         // Serializes/deserializes a Algorithm to/from a amlz-specific proto.
         SerializedAlgorithm ToProto() const;
         void FromProto(const SerializedAlgorithm& checkpoint_algorithm);

         // Returns a reference to the given component function in the Algorithm.
         const std::vector<std::shared_ptr<const Instruction>>&
            ComponentFunction(ComponentFunctionT component_function_type) const;
         std::vector<std::shared_ptr<const Instruction>>* MutableComponentFunction(
               ComponentFunctionT component_function_type);

         // Setup, predict, and learn component functions.
         std::vector<std::shared_ptr<const Instruction>> setup_;
         std::vector<std::shared_ptr<const Instruction>> predict_;
         std::vector<std::shared_ptr<const Instruction>> learn_;

         size_t SizeEffective() const { return setupEffective_.size() + predictEffective_.size() + learnEffective_.size(); }
         size_t Size() const { return setup_.size() + predict_.size() + learn_.size(); }

         // Ineffective code removal data and functions.

         // Setup, predict, and learn component functions, effective code only.
         std::vector<std::shared_ptr<const Instruction>> setupEffective_;
         std::vector<std::shared_ptr<const Instruction>> predictEffective_;
         std::vector<std::shared_ptr<const Instruction>> learnEffective_;

         void SetEffectiveInstructions();
         void CopyAllComponentsToEffective();

         const size_t out_mem_type_index = 0;
         const size_t in1_mem_type_index = 1;
         const size_t in2_mem_type_index = 2;
         std::array<
            std::array<int, NUM_MEMORY_TYPES>,
            128> OpMemoryTypes = {{
               {NA_TYPE, NA_TYPE, NA_TYPE},                   // NO_OP = 0
               {SCALAR_TYPE, SCALAR_TYPE, SCALAR_TYPE},       // SCALAR_SUM_OP = 1
               {SCALAR_TYPE, SCALAR_TYPE, SCALAR_TYPE},       // SCALAR_DIFF_OP = 2 confirmed
               {SCALAR_TYPE, SCALAR_TYPE, SCALAR_TYPE},       // SCALAR_PRODUCT_OP = 3 confirmed
               {SCALAR_TYPE, SCALAR_TYPE, SCALAR_TYPE},       // SCALAR_DIVISION_OP = 4
               {SCALAR_TYPE, SCALAR_TYPE, NA_TYPE},           // SCALAR_ABS_OP = 5
               {SCALAR_TYPE, SCALAR_TYPE, NA_TYPE},           // SCALAR_RECIPROCAL_OP = 6
               {SCALAR_TYPE, SCALAR_TYPE, NA_TYPE},           // SCALAR_SIN_OP = 7
               {SCALAR_TYPE, SCALAR_TYPE, NA_TYPE},           // SCALAR_COS_OP = 8
               {SCALAR_TYPE, SCALAR_TYPE, NA_TYPE},           // SCALAR_TAN_OP = 9
               {SCALAR_TYPE, SCALAR_TYPE, NA_TYPE},           // SCALAR_ARCSIN_OP = 10
               {SCALAR_TYPE, SCALAR_TYPE, NA_TYPE},           // SCALAR_ARCCOS_OP = 11
               {SCALAR_TYPE, SCALAR_TYPE, NA_TYPE},           // SCALAR_ARCTAN_OP = 12
               {SCALAR_TYPE, SCALAR_TYPE, NA_TYPE},           // SCALAR_EXP_OP = 13
               {SCALAR_TYPE, SCALAR_TYPE, NA_TYPE},           // SCALAR_LOG_OP = 14
               {SCALAR_TYPE, SCALAR_TYPE, NA_TYPE},           // SCALAR_HEAVYSIDE_OP = 15
               {VECTOR_TYPE, VECTOR_TYPE, NA_TYPE},           // VECTOR_HEAVYSIDE_OP = 16
               {MATRIX_TYPE, MATRIX_TYPE, NA_TYPE},           // MATRIX_HEAVYSIDE_OP = 17
               {VECTOR_TYPE, SCALAR_TYPE, VECTOR_TYPE},       // SCALAR_VECTOR_PRODUCT_OP = 18 confirmed
               {VECTOR_TYPE, SCALAR_TYPE, NA_TYPE},           // SCALAR_BROADCAST_OP = 19
               {VECTOR_TYPE, VECTOR_TYPE, NA_TYPE},           // VECTOR_RECIPROCAL_OP = 20
               {SCALAR_TYPE, VECTOR_TYPE, NA_TYPE},           // VECTOR_NORM_OP = 21
               {VECTOR_TYPE, VECTOR_TYPE, NA_TYPE},           // VECTOR_ABS_OP = 22
               {VECTOR_TYPE, VECTOR_TYPE, VECTOR_TYPE},       // VECTOR_SUM_OP = 23 confirmed
               {VECTOR_TYPE, VECTOR_TYPE, VECTOR_TYPE},       // VECTOR_DIFF_OP = 24
               {VECTOR_TYPE, VECTOR_TYPE, VECTOR_TYPE},       // VECTOR_PRODUCT_OP = 25
               {VECTOR_TYPE, VECTOR_TYPE, VECTOR_TYPE},       // VECTOR_DIVISION_OP = 26
               {SCALAR_TYPE, VECTOR_TYPE, VECTOR_TYPE},       // VECTOR_INNER_PRODUCT_OP = 27
               {MATRIX_TYPE, VECTOR_TYPE, VECTOR_TYPE},       // VECTOR_OUTER_PRODUCT_OP = 28
               {MATRIX_TYPE, MATRIX_TYPE, SCALAR_TYPE},       // SCALAR_MATRIX_PRODUCT_OP = 29
               {MATRIX_TYPE, MATRIX_TYPE, NA_TYPE},           // MATRIX_RECIPROCAL_OP = 30
               {VECTOR_TYPE, MATRIX_TYPE, VECTOR_TYPE},       // MATRIX_VECTOR_PRODUCT_OP = 31
               {MATRIX_TYPE, VECTOR_TYPE, NA_TYPE},           // VECTOR_COLUMN_BROADCAST_OP = 32
               {MATRIX_TYPE, VECTOR_TYPE, NA_TYPE},           // VECTOR_ROW_BROADCAST_OP = 33
               {SCALAR_TYPE, MATRIX_TYPE, NA_TYPE},           // MATRIX_NORM_OP = 34
               {VECTOR_TYPE, MATRIX_TYPE, NA_TYPE},           // MATRIX_COLUMN_NORM_OP = 35
               {VECTOR_TYPE, MATRIX_TYPE, NA_TYPE},           // MATRIX_ROW_NORM_OP = 36
               {MATRIX_TYPE, MATRIX_TYPE, NA_TYPE},           // MATRIX_TRANSPOSE_OP = 37
               {MATRIX_TYPE, MATRIX_TYPE, NA_TYPE},           // MATRIX_ABS_OP = 38
               {MATRIX_TYPE, MATRIX_TYPE, MATRIX_TYPE},       // MATRIX_SUM_OP = 39
               {MATRIX_TYPE, MATRIX_TYPE, MATRIX_TYPE},       // MATRIX_DIFF_OP = 40
               {MATRIX_TYPE, MATRIX_TYPE, MATRIX_TYPE},       // MATRIX_PRODUCT_OP = 41
               {MATRIX_TYPE, MATRIX_TYPE, MATRIX_TYPE},       // MATRIX_DIVISION_OP = 42
               {MATRIX_TYPE, MATRIX_TYPE, MATRIX_TYPE},       // MATRIX_MATRIX_PRODUCT_OP = 43
               {SCALAR_TYPE, SCALAR_TYPE, SCALAR_TYPE},       // SCALAR_MIN_OP = 44
               {VECTOR_TYPE, VECTOR_TYPE, VECTOR_TYPE},       // VECTOR_MIN_OP = 45
               {MATRIX_TYPE, MATRIX_TYPE, MATRIX_TYPE},       // MATRIX_MIN_OP = 46
               {SCALAR_TYPE, SCALAR_TYPE, SCALAR_TYPE},       // SCALAR_MAX_OP = 47
               {VECTOR_TYPE, VECTOR_TYPE, VECTOR_TYPE},       // VECTOR_MAX_OP = 48
               {MATRIX_TYPE, MATRIX_TYPE, MATRIX_TYPE},       // MATRIX_MAX_OP = 49
               {SCALAR_TYPE, VECTOR_TYPE, NA_TYPE},           // VECTOR_MEAN_OP = 50
               {SCALAR_TYPE, MATRIX_TYPE, NA_TYPE},           // MATRIX_MEAN_OP = 51
               {VECTOR_TYPE, MATRIX_TYPE, NA_TYPE},           // MATRIX_ROW_MEAN_OP = 52
               {VECTOR_TYPE, MATRIX_TYPE, NA_TYPE},           // MATRIX_ROW_ST_DEV_OP = 53
               {SCALAR_TYPE, MATRIX_TYPE, NA_TYPE},           // VECTOR_ST_DEV_OP = 54
               {SCALAR_TYPE, MATRIX_TYPE, NA_TYPE},           // MATRIX_ST_DEV_OP = 55
               {SCALAR_TYPE, NA_TYPE, NA_TYPE},               // SCALAR_CONST_SET_OP = 56 confirmed
               {VECTOR_TYPE, NA_TYPE, NA_TYPE},               // VECTOR_CONST_SET_OP = 57
               {MATRIX_TYPE, NA_TYPE, NA_TYPE},               // MATRIX_CONST_SET_OP = 58
               {SCALAR_TYPE, NA_TYPE, NA_TYPE},               // SCALAR_UNIFORM_SET_OP = 59
               {VECTOR_TYPE, NA_TYPE, NA_TYPE},               // VECTOR_UNIFORM_SET_OP = 60
               {MATRIX_TYPE, NA_TYPE, NA_TYPE},               // MATRIX_UNIFORM_SET_OP = 61
               {SCALAR_TYPE, NA_TYPE, NA_TYPE},               // SCALAR_GAUSSIAN_SET_OP = 62
               {VECTOR_TYPE, NA_TYPE, NA_TYPE},               // VECTOR_GAUSSIAN_SET_OP = 63
               {MATRIX_TYPE, NA_TYPE, NA_TYPE},               // MATRIX_GAUSSIAN_SET_OP = 64
               {NA_TYPE, NA_TYPE, NA_TYPE},                   // UNSUPPORTED_OP = 65
               {NA_TYPE, NA_TYPE, NA_TYPE},                   // UNSUPPORTED_OP = 66
               {NA_TYPE, NA_TYPE, NA_TYPE},                   // UNSUPPORTED_OP = 67
               {NA_TYPE, NA_TYPE, NA_TYPE},                   // UNSUPPORTED_OP = 68
               {NA_TYPE, NA_TYPE, NA_TYPE},                   // UNSUPPORTED_OP = 69
               {NA_TYPE, NA_TYPE, NA_TYPE},                   // UNSUPPORTED_OP = 70
               {NA_TYPE, NA_TYPE, NA_TYPE},                   // UNSUPPORTED_OP = 71
               {NA_TYPE, NA_TYPE, NA_TYPE},                   // UNSUPPORTED_OP = 72
               {NA_TYPE, NA_TYPE, NA_TYPE},                   // UNSUPPORTED_OP = 73
               {NA_TYPE, NA_TYPE, NA_TYPE},                   // UNSUPPORTED_OP = 74
               {NA_TYPE, NA_TYPE, NA_TYPE},                   // UNSUPPORTED_OP = 75
               {NA_TYPE, NA_TYPE, NA_TYPE},                   // UNSUPPORTED_OP = 76
               {NA_TYPE, NA_TYPE, NA_TYPE},                   // UNSUPPORTED_OP = 77
               {NA_TYPE, NA_TYPE, NA_TYPE},                   // UNSUPPORTED_OP = 78
               {NA_TYPE, NA_TYPE, NA_TYPE},                   // UNSUPPORTED_OP = 79
               {NA_TYPE, NA_TYPE, NA_TYPE},                   // UNSUPPORTED_OP = 80
               {NA_TYPE, NA_TYPE, NA_TYPE},                   // UNSUPPORTED_OP = 81
               {NA_TYPE, NA_TYPE, NA_TYPE},                   // UNSUPPORTED_OP = 82
               {NA_TYPE, NA_TYPE, NA_TYPE},                   // UNSUPPORTED_OP = 83
               {NA_TYPE, NA_TYPE, NA_TYPE},                   // UNSUPPORTED_OP = 84
               {NA_TYPE, NA_TYPE, NA_TYPE},                   // UNSUPPORTED_OP = 85
               {NA_TYPE, NA_TYPE, NA_TYPE},                   // UNSUPPORTED_OP = 86
               {NA_TYPE, NA_TYPE, NA_TYPE},                   // UNSUPPORTED_OP = 87
               {NA_TYPE, NA_TYPE, NA_TYPE},                   // UNSUPPORTED_OP = 88
               {NA_TYPE, NA_TYPE, NA_TYPE},                   // UNSUPPORTED_OP = 89
               {NA_TYPE, NA_TYPE, NA_TYPE},                   // UNSUPPORTED_OP = 90
               {NA_TYPE, NA_TYPE, NA_TYPE},                   // UNSUPPORTED_OP = 91
               {NA_TYPE, NA_TYPE, NA_TYPE},                   // UNSUPPORTED_OP = 92
               {NA_TYPE, NA_TYPE, NA_TYPE},                   // UNSUPPORTED_OP = 93
               {NA_TYPE, NA_TYPE, NA_TYPE},                   // UNSUPPORTED_OP = 94
               {NA_TYPE, NA_TYPE, NA_TYPE},                   // UNSUPPORTED_OP = 95
               {NA_TYPE, NA_TYPE, NA_TYPE},                   // UNSUPPORTED_OP = 96
               {NA_TYPE, NA_TYPE, NA_TYPE},                   // UNSUPPORTED_OP = 97
               {NA_TYPE, NA_TYPE, NA_TYPE},                   // UNSUPPORTED_OP = 98
               {NA_TYPE, NA_TYPE, NA_TYPE},                   // UNSUPPORTED_OP = 99
               {NA_TYPE, NA_TYPE, NA_TYPE},                   // UNSUPPORTED_OP = 100
               {NA_TYPE, NA_TYPE, NA_TYPE},                   // UNSUPPORTED_OP = 101
               {NA_TYPE, NA_TYPE, NA_TYPE},                   // UNSUPPORTED_OP = 102
               {NA_TYPE, NA_TYPE, NA_TYPE},                   // UNSUPPORTED_OP = 103
               {NA_TYPE, NA_TYPE, NA_TYPE},                   // UNSUPPORTED_OP = 104
               {NA_TYPE, NA_TYPE, NA_TYPE},                   // UNSUPPORTED_OP = 105
               {NA_TYPE, NA_TYPE, NA_TYPE},                   // UNSUPPORTED_OP = 106
               {NA_TYPE, NA_TYPE, NA_TYPE},                   // UNSUPPORTED_OP = 107
               {NA_TYPE, NA_TYPE, NA_TYPE},                   // UNSUPPORTED_OP = 108
               {NA_TYPE, NA_TYPE, NA_TYPE},                   // UNSUPPORTED_OP = 109
               {NA_TYPE, NA_TYPE, NA_TYPE},                   // UNSUPPORTED_OP = 110
               {NA_TYPE, NA_TYPE, NA_TYPE},                   // UNSUPPORTED_OP = 111
               {NA_TYPE, NA_TYPE, NA_TYPE},                   // UNSUPPORTED_OP = 112
               {NA_TYPE, NA_TYPE, NA_TYPE},                   // UNSUPPORTED_OP = 113
               {NA_TYPE, NA_TYPE, NA_TYPE},                   // UNSUPPORTED_OP = 114
               {NA_TYPE, NA_TYPE, NA_TYPE},                   // UNSUPPORTED_OP = 115
               {NA_TYPE, NA_TYPE, NA_TYPE},                   // UNSUPPORTED_OP = 116
               {NA_TYPE, NA_TYPE, NA_TYPE},                   // UNSUPPORTED_OP = 117
               {NA_TYPE, NA_TYPE, NA_TYPE},                   // UNSUPPORTED_OP = 118
               {NA_TYPE, NA_TYPE, NA_TYPE},                   // UNSUPPORTED_OP = 119
               {NA_TYPE, NA_TYPE, NA_TYPE},                   // UNSUPPORTED_OP = 120
               {NA_TYPE, NA_TYPE, NA_TYPE},                   // UNSUPPORTED_OP = 121
               {NA_TYPE, NA_TYPE, NA_TYPE},                   // UNSUPPORTED_OP = 122
               {NA_TYPE, NA_TYPE, NA_TYPE},                   // UNSUPPORTED_OP = 123
               {NA_TYPE, NA_TYPE, NA_TYPE},                   // UNSUPPORTED_OP = 124
               {NA_TYPE, NA_TYPE, NA_TYPE},                   // UNSUPPORTED_OP = 125
               {NA_TYPE, NA_TYPE, NA_TYPE},                   // UNSUPPORTED_OP = 126
               {NA_TYPE, NA_TYPE, NA_TYPE}                    // UNSUPPORTED_OP = 127
            }};

         size_t GetMemTypeOut(std::shared_ptr<const Instruction> instruction) const {
            return OpMemoryTypes[instruction->op_][out_mem_type_index];
         }

         size_t GetMemTypeIn1(std::shared_ptr<const Instruction> instruction) const {
            return OpMemoryTypes[instruction->op_][in1_mem_type_index];
         }

         size_t GetMemTypeIn2(std::shared_ptr<const Instruction> instruction) const {
            return OpMemoryTypes[instruction->op_][in2_mem_type_index];
         }

         void MarkEffectiveInstructionsInComponent(
               std::vector<std::shared_ptr<const Instruction>> &component_function, 
               std::map<int, std::vector<bool> > &targets_a,
               std::map<int, std::vector<bool> > &targets_b,
               std::vector<unsigned char> &effective_instructions);

         void UnmarkOverwrittenInstructions(
               std::vector<std::shared_ptr<const Instruction>> &component_function,
               std::vector<unsigned char> &effective_instructions,
               std::vector<std::vector<memTime>> &readWriteTimes,
               int &instruction_number,
               bool mark);
   };

   struct memTime {
    int readTime = -1;
    int writeTime = -1;
    unsigned char *effective_instr;
  };

}  // namespace automl_zero

#endif  // AUTOML_ZERO_ALGORITHM_H_
