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

#include "algorithm.h"

#include <sstream>
#include <string>
#include <vector>

#include "definitions.h"
#include "instruction.h"
#include "random_generator.h"
#include "absl/flags/flag.h"

namespace automl_zero {

   using ::std::istringstream;  // NOLINT
   using ::std::make_shared;  // NOLINT
   using ::std::ostream;  // NOLINT
   using ::std::ostringstream;  // NOLINT
   using ::std::shared_ptr;  // NOLINT
   using ::std::string;  // NOLINT
   using ::std::stringstream;  // NOLINT
   using ::std::vector;  // NOLINT

   Algorithm::Algorithm(const SerializedAlgorithm& checkpoint_algorithm) {
      this->FromProto(checkpoint_algorithm);
   }

   inline void ShallowCopyComponentFunction(
         const vector<shared_ptr<const Instruction>>& src,
         vector<shared_ptr<const Instruction>>* dest) {
      dest->reserve(src.size());
      dest->clear();
      for (const shared_ptr<const Instruction>& src_instr : src) {
         dest->emplace_back(src_instr);
      }
   }

   Algorithm::Algorithm(const Algorithm& other) {
      ShallowCopyComponentFunction(other.setup_, &this->setup_);
      ShallowCopyComponentFunction(other.predict_, &this->predict_);
      ShallowCopyComponentFunction(other.learn_, &this->learn_);
   }

   Algorithm& Algorithm::operator=(const Algorithm& other) {
      if (&other != this) {
         ShallowCopyComponentFunction(other.setup_, &this->setup_);
         ShallowCopyComponentFunction(other.predict_, &this->predict_);
         ShallowCopyComponentFunction(other.learn_, &this->learn_);
      }
      return *this;
   }

   Algorithm::Algorithm(Algorithm&& other) {
      setup_ = std::move(other.setup_);
      predict_ = std::move(other.predict_);
      learn_ = std::move(other.learn_);
   }

   Algorithm& Algorithm::operator=(Algorithm&& other) {
      if (&other != this) {
         setup_ = std::move(other.setup_);
         predict_ = std::move(other.predict_);
         learn_ = std::move(other.learn_);
      }
      return *this;
   }

   inline bool IsComponentFunctionEqual(
         const vector<shared_ptr<const Instruction>>& component_function1,
         const vector<shared_ptr<const Instruction>>& component_function2) {
      if (component_function1.size() != component_function2.size()) {
         return false;
      }
      vector<shared_ptr<const Instruction>>::const_iterator instruction1_it =
         component_function1.begin();
      for (const shared_ptr<const Instruction>& instruction2 :
            component_function2) {
         if (*instruction2 != **instruction1_it) return false;
         ++instruction1_it;
      }
      CHECK(instruction1_it == component_function1.end());
      return true;
   }

   bool Algorithm::operator==(const Algorithm& other) const {
      if (!IsComponentFunctionEqual(setup_, other.setup_)) return false;
      if (!IsComponentFunctionEqual(predict_, other.predict_)) return false;
      if (!IsComponentFunctionEqual(learn_, other.learn_)) return false;
      return true;
   }

   string Algorithm::ToReadable() const {
      ostringstream stream;
      stream << "def Setup():" << std::endl;
      for (const shared_ptr<const Instruction>& instruction : setup_) {
         stream << instruction->ToString();
      }
      stream << "def Predict():" << std::endl;
      for (const shared_ptr<const Instruction>& instruction : predict_) {
         stream << instruction->ToString();
      }
      stream << "def Learn():" << std::endl;
      for (const shared_ptr<const Instruction>& instruction : learn_) {
         stream << instruction->ToString();
      }
      return stream.str();
   }

   string Algorithm::ToReadableEffective() const {
      ostringstream stream;
      stream << "def Setup():" << std::endl;
      for (const shared_ptr<const Instruction>& instruction : setupEffective_) {
         stream << instruction->ToString();
      }
      stream << "def Predict():" << std::endl;
      for (const shared_ptr<const Instruction>& instruction : predictEffective_) {
         stream << instruction->ToString();
      }
      stream << "def Learn():" << std::endl;
      for (const shared_ptr<const Instruction>& instruction : learnEffective_) {
         stream << instruction->ToString();
      }
      return stream.str();
   }

   SerializedAlgorithm Algorithm::ToProto() const {
      SerializedAlgorithm checkpoint_algorithm;
      for (const shared_ptr<const Instruction>& instr : setup_) {
         *checkpoint_algorithm.add_setup_instructions() = instr->Serialize();
      }
      for (const shared_ptr<const Instruction>& instr : predict_) {
         *checkpoint_algorithm.add_predict_instructions() = instr->Serialize();
      }
      for (const shared_ptr<const Instruction>& instr : learn_) {
         *checkpoint_algorithm.add_learn_instructions() = instr->Serialize();
      }
      return checkpoint_algorithm;
   }

   void Algorithm::FromProto(const SerializedAlgorithm& checkpoint_algorithm) {
      setup_.reserve(checkpoint_algorithm.setup_instructions_size());
      setup_.clear();
      for (const SerializedInstruction& checkpoint_instruction :
            checkpoint_algorithm.setup_instructions()) {
         setup_.emplace_back(
               make_shared<const Instruction>(checkpoint_instruction));
      }

      predict_.reserve(checkpoint_algorithm.predict_instructions_size());
      predict_.clear();
      for (const SerializedInstruction& checkpoint_instruction :
            checkpoint_algorithm.predict_instructions()) {
         predict_.emplace_back(
               make_shared<const Instruction>(checkpoint_instruction));
      }

      learn_.reserve(checkpoint_algorithm.learn_instructions_size());
      learn_.clear();
      for (const SerializedInstruction& checkpoint_instruction :
            checkpoint_algorithm.learn_instructions()) {
         learn_.emplace_back(
               make_shared<const Instruction>(checkpoint_instruction));
      }
   }

   const vector<shared_ptr<const Instruction>>& Algorithm::ComponentFunction(
         const ComponentFunctionT component_function_type) const {
      switch (component_function_type) {
         case kSetupComponentFunction:
            return setup_;
         case kPredictComponentFunction:
            return predict_;
         case kLearnComponentFunction:
            return learn_;
      }
   }

   vector<shared_ptr<const Instruction>>* Algorithm::MutableComponentFunction(
         const ComponentFunctionT component_function_type) {
      switch (component_function_type) {
         case kSetupComponentFunction:
            return &setup_;
         case kPredictComponentFunction:
            return &predict_;
         case kLearnComponentFunction:
            return &learn_;
      }
   }

   //Exeperimental
   void Algorithm::SetEffectiveInstructions() {

      // Working record of outputs used in this algorithm.
      std::map<int, std::vector<bool> > targets_1; //[memory type][memory index]->true/false
      targets_1[SCALAR_TYPE] = std::vector<bool>(MAX_SCALAR_ADDRESSES, false);
      targets_1[VECTOR_TYPE] = std::vector<bool>(MAX_VECTOR_ADDRESSES, false);
      targets_1[MATRIX_TYPE] = std::vector<bool>(MAX_MATRIX_ADDRESSES, false);

      std::map<int, std::vector<bool> > targets_2; //[memory type][memory index]->true/false
      targets_2[SCALAR_TYPE] = std::vector<bool>(MAX_SCALAR_ADDRESSES, false);
      targets_2[VECTOR_TYPE] = std::vector<bool>(MAX_VECTOR_ADDRESSES, false);
      targets_2[MATRIX_TYPE] = std::vector<bool>(MAX_MATRIX_ADDRESSES, false);

      // Working record of effective instructions in each component.
      std::vector<unsigned char> learnEffective;
      learnEffective.assign(learn_.size(), 0);
      std::vector<unsigned char> predictEffective;
      predictEffective.assign(predict_.size(), 0);
      std::vector<unsigned char> setupEffective;
      setupEffective.assign(setup_.size(), 0);

      int effective_size = 0;
      int prev_effective_size = 0;
      size_t pass = 0;
      // Several passes backward through component functions since they interact with each other.
      while (effective_size != prev_effective_size || ++pass <= 2) {
         // Set const memory address targets.
         targets_1[SCALAR_TYPE][kLabelsScalarAddress] = true;
         targets_1[SCALAR_TYPE][kPredictionsScalarAddress] = true;
         targets_1[VECTOR_TYPE][kFeaturesVectorAddress] = true;

         MarkEffectiveInstructionsInComponent(learn_, targets_1, targets_1, learnEffective);

         // Set const memory address targets.
         targets_1[SCALAR_TYPE][kLabelsScalarAddress] = false;
         targets_1[SCALAR_TYPE][kPredictionsScalarAddress] = true;
         targets_1[VECTOR_TYPE][kFeaturesVectorAddress] = true;

         MarkEffectiveInstructionsInComponent(predict_, targets_1, targets_1, predictEffective);

         // These const memory address targets are not relevant to setup.
         targets_1[SCALAR_TYPE][kLabelsScalarAddress] = false;
         targets_1[SCALAR_TYPE][kPredictionsScalarAddress] = true;
         targets_1[VECTOR_TYPE][kFeaturesVectorAddress] = false;

         MarkEffectiveInstructionsInComponent(setup_, targets_1, targets_2, setupEffective);

         // Final pass through setup to catch operations on uninitialized memory.
         std::map<int, std::vector<bool> > targets_3; //[memory type][memory index]->true/false
         targets_3[SCALAR_TYPE] = std::vector<bool>(MAX_SCALAR_ADDRESSES, false);
         targets_3[VECTOR_TYPE] = std::vector<bool>(MAX_VECTOR_ADDRESSES, false);
         targets_3[MATRIX_TYPE] = std::vector<bool>(MAX_MATRIX_ADDRESSES, false);
         int i = 0;
         for (const shared_ptr<const Instruction> instruction : setup_) {
            if (setupEffective[i] == 0){ i++; continue; }
            if ((GetMemTypeIn1(instruction) == NA_TYPE || !targets_3[GetMemTypeIn1(instruction)][(instruction)->in1_]) &&  //in1 NA or not target
                  (GetMemTypeIn2(instruction) == NA_TYPE || !targets_3[GetMemTypeIn2(instruction)][(instruction)->in2_]) && //in2 NA or not target
                  !(GetMemTypeIn1(instruction) == NA_TYPE && GetMemTypeIn2(instruction) == NA_TYPE) && //in1 and in2 not both NA
                  !targets_3[GetMemTypeOut(instruction)][(instruction)->out_]) //output ot target
            { 
               setupEffective[i] = 0;
            }
            else
               targets_3[GetMemTypeOut(instruction)][instruction->out_] = true;
            i++;
         }
         prev_effective_size = effective_size;
         effective_size = std::count(setupEffective.begin(), setupEffective.end(), 1) +
            std::count(predictEffective.begin(), predictEffective.end(), 1) +
            std::count(learnEffective.begin(), learnEffective.end(), 1);
      }

      //Unmark instructions that write to memory which is overwritten before it is read again
      std::vector<std::vector<memTime>> readWriteTimes;
      readWriteTimes.resize(NUM_MEMORY_TYPES);
      readWriteTimes[SCALAR_TYPE].resize(MAX_SCALAR_ADDRESSES);
      readWriteTimes[VECTOR_TYPE].resize(MAX_VECTOR_ADDRESSES);
      readWriteTimes[MATRIX_TYPE].resize(MAX_MATRIX_ADDRESSES);

      int instruction_number = 0;
      UnmarkOverwrittenInstructions(setup_, setupEffective, readWriteTimes, instruction_number, true);
      UnmarkOverwrittenInstructions(predict_, predictEffective, readWriteTimes, instruction_number, true);
      UnmarkOverwrittenInstructions(learn_, learnEffective, readWriteTimes, instruction_number, true);
      UnmarkOverwrittenInstructions(predict_, predictEffective, readWriteTimes, instruction_number, true);
      UnmarkOverwrittenInstructions(learn_, learnEffective, readWriteTimes, instruction_number, true);

      // Final pass to copy effective instructions.
      learnEffective_.clear();
      int i = 0;
      for (const shared_ptr<const Instruction> instruction : learn_) {
         if (learnEffective[i] == 1 || learnEffective[i] > 1) {
            learnEffective_.push_back(instruction);
         }
         i++;
      }
      predictEffective_.clear();
      i = 0;
      for (const shared_ptr<const Instruction> instruction : predict_) {
         if (predictEffective[i] == 1 || predictEffective[i] > 1) {
            predictEffective_.push_back(instruction);
         }
         i++;
      }
      setupEffective_.clear();
      i = 0;
      for (const shared_ptr<const Instruction> instruction : setup_) {   
         if (setupEffective[i] == 1 || setupEffective[i] > 1) {  
            setupEffective_.push_back(instruction);
         }
         i++;
      }
   } 

   void Algorithm::MarkEffectiveInstructionsInComponent(
         std::vector<std::shared_ptr<const Instruction>> &component_function,
         std::map<int, std::vector<bool> > &targets_a,
         std::map<int, std::vector<bool> > &targets_b,
         std::vector<unsigned char> &effective_instructions) {
      std::vector <std::shared_ptr<const Instruction>> :: reverse_iterator riter;
      int i = component_function.size() - 1;
      for (riter = component_function.rbegin(); riter != component_function.rend(); i--, riter++) {
         // Instruction is effective if output is a memory index used later in this algorithm.
         // Since setup() is only run once, it's sources should be marked separately so they don't result in
         // false positive effective instructions in predict() and learn(). 
         // In this case target_a and traget_b should be unique refs, otherwise they refer to the same targets.
         if (targets_a[GetMemTypeOut(*riter)][(*riter)->out_] || targets_b[GetMemTypeOut(*riter)][(*riter)->out_]) { 
            if (GetMemTypeIn1(*riter) != NA_TYPE) {
               targets_b[GetMemTypeIn1(*riter)][(*riter)->in1_] = true; //in1 sourced in this op, mark
            }
            if (GetMemTypeIn2(*riter) != NA_TYPE) {
               targets_b[GetMemTypeIn2(*riter)][(*riter)->in2_] = true; //in2 sourced in this op, mark
            }
            effective_instructions[i] = 1;
         }
      }
   }

   //Unmark instructions that write to memory, only to have the value overwritten before it is read
   void Algorithm::UnmarkOverwrittenInstructions(
         std::vector<std::shared_ptr<const Instruction>> &component_function,
         std::vector<unsigned char> &effective_instructions,
         std::vector <std::vector<memTime>> &readWriteTimes,
         int &instruction_number,
         bool mark) {
      int i = 0;
      for (const shared_ptr<const Instruction> instruction : component_function) {
         if (effective_instructions[i] == 0) { 
            instruction_number++;
            i++;
            continue;
         }
         //If output not read since last write and not read this instruction,
         //unmark previous write
         if (
               readWriteTimes[GetMemTypeOut(instruction)][(instruction)->out_].readTime <
               readWriteTimes[GetMemTypeOut(instruction)][(instruction)->out_].writeTime &&
               !(GetMemTypeOut(instruction) == GetMemTypeIn1(instruction) && (instruction)->out_ == (instruction)->in1_) &&
               !(GetMemTypeOut(instruction) == GetMemTypeIn2(instruction) && (instruction)->out_ == (instruction)->in2_) &&
               !(GetMemTypeOut(instruction) == SCALAR_TYPE && (instruction)->out_ == kPredictionsScalarAddress) &&
               !(GetMemTypeOut(instruction) == SCALAR_TYPE && (instruction)->out_ == kLabelsScalarAddress) &&
               !(GetMemTypeOut(instruction) == VECTOR_TYPE && (instruction)->out_ == kFeaturesVectorAddress) &&
               !(GetMemTypeIn1(instruction) == NA_TYPE && GetMemTypeIn2(instruction) == NA_TYPE) &&//ignore constant set
               mark
            ) {
            *(readWriteTimes[GetMemTypeOut(instruction)][(instruction)->out_].effective_instr) += 1;
         }

         readWriteTimes[GetMemTypeOut(instruction)][(instruction)->out_].writeTime = instruction_number;
         readWriteTimes[GetMemTypeOut(instruction)][(instruction)->out_].effective_instr = &effective_instructions[i];

         if (GetMemTypeIn1(instruction) != NA_TYPE) {
            readWriteTimes[GetMemTypeIn1(instruction)][(instruction)->in1_].readTime = instruction_number;
         }

         if (GetMemTypeIn2(instruction) != NA_TYPE) {
            readWriteTimes[GetMemTypeIn2(instruction)][(instruction)->in2_].readTime = instruction_number;
         }
         instruction_number++;
         i++;
      }
   }

   void Algorithm::CopyAllComponentsToEffective() {
      setupEffective_ = setup_;
      predictEffective_ = predict_;
      learnEffective_ = learn_;
   }

}  // namespace automl_zero
