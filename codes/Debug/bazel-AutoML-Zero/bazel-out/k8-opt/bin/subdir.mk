################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../bazel-AutoML-Zero/bazel-out/k8-opt/bin/algorithm.pb.cc \
../bazel-AutoML-Zero/bazel-out/k8-opt/bin/experiment.pb.cc \
../bazel-AutoML-Zero/bazel-out/k8-opt/bin/fec_cache.pb.cc \
../bazel-AutoML-Zero/bazel-out/k8-opt/bin/generator.pb.cc \
../bazel-AutoML-Zero/bazel-out/k8-opt/bin/instruction.pb.cc \
../bazel-AutoML-Zero/bazel-out/k8-opt/bin/mutator.pb.cc \
../bazel-AutoML-Zero/bazel-out/k8-opt/bin/task.pb.cc \
../bazel-AutoML-Zero/bazel-out/k8-opt/bin/train_budget.pb.cc 

CC_DEPS += \
./bazel-AutoML-Zero/bazel-out/k8-opt/bin/algorithm.pb.d \
./bazel-AutoML-Zero/bazel-out/k8-opt/bin/experiment.pb.d \
./bazel-AutoML-Zero/bazel-out/k8-opt/bin/fec_cache.pb.d \
./bazel-AutoML-Zero/bazel-out/k8-opt/bin/generator.pb.d \
./bazel-AutoML-Zero/bazel-out/k8-opt/bin/instruction.pb.d \
./bazel-AutoML-Zero/bazel-out/k8-opt/bin/mutator.pb.d \
./bazel-AutoML-Zero/bazel-out/k8-opt/bin/task.pb.d \
./bazel-AutoML-Zero/bazel-out/k8-opt/bin/train_budget.pb.d 

OBJS += \
./bazel-AutoML-Zero/bazel-out/k8-opt/bin/algorithm.pb.o \
./bazel-AutoML-Zero/bazel-out/k8-opt/bin/experiment.pb.o \
./bazel-AutoML-Zero/bazel-out/k8-opt/bin/fec_cache.pb.o \
./bazel-AutoML-Zero/bazel-out/k8-opt/bin/generator.pb.o \
./bazel-AutoML-Zero/bazel-out/k8-opt/bin/instruction.pb.o \
./bazel-AutoML-Zero/bazel-out/k8-opt/bin/mutator.pb.o \
./bazel-AutoML-Zero/bazel-out/k8-opt/bin/task.pb.o \
./bazel-AutoML-Zero/bazel-out/k8-opt/bin/train_budget.pb.o 


# Each subdirectory must supply rules for building sources it contributes
bazel-AutoML-Zero/bazel-out/k8-opt/bin/%.o: ../bazel-AutoML-Zero/bazel-out/k8-opt/bin/%.cc bazel-AutoML-Zero/bazel-out/k8-opt/bin/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C++ Compiler'
	g++ -std=c++17 -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


