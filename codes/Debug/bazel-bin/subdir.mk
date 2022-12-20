################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../bazel-bin/algorithm.pb.cc \
../bazel-bin/experiment.pb.cc \
../bazel-bin/fec_cache.pb.cc \
../bazel-bin/generator.pb.cc \
../bazel-bin/instruction.pb.cc \
../bazel-bin/mutator.pb.cc \
../bazel-bin/task.pb.cc \
../bazel-bin/train_budget.pb.cc 

CC_DEPS += \
./bazel-bin/algorithm.pb.d \
./bazel-bin/experiment.pb.d \
./bazel-bin/fec_cache.pb.d \
./bazel-bin/generator.pb.d \
./bazel-bin/instruction.pb.d \
./bazel-bin/mutator.pb.d \
./bazel-bin/task.pb.d \
./bazel-bin/train_budget.pb.d 

OBJS += \
./bazel-bin/algorithm.pb.o \
./bazel-bin/experiment.pb.o \
./bazel-bin/fec_cache.pb.o \
./bazel-bin/generator.pb.o \
./bazel-bin/instruction.pb.o \
./bazel-bin/mutator.pb.o \
./bazel-bin/task.pb.o \
./bazel-bin/train_budget.pb.o 


# Each subdirectory must supply rules for building sources it contributes
bazel-bin/%.o: ../bazel-bin/%.cc bazel-bin/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C++ Compiler'
	g++ -std=c++17 -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


