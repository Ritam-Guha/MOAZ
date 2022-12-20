################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../bazel-out/k8-opt/bin/algorithm.pb.cc \
../bazel-out/k8-opt/bin/experiment.pb.cc \
../bazel-out/k8-opt/bin/fec_cache.pb.cc \
../bazel-out/k8-opt/bin/generator.pb.cc \
../bazel-out/k8-opt/bin/instruction.pb.cc \
../bazel-out/k8-opt/bin/mutator.pb.cc \
../bazel-out/k8-opt/bin/task.pb.cc \
../bazel-out/k8-opt/bin/train_budget.pb.cc 

CC_DEPS += \
./bazel-out/k8-opt/bin/algorithm.pb.d \
./bazel-out/k8-opt/bin/experiment.pb.d \
./bazel-out/k8-opt/bin/fec_cache.pb.d \
./bazel-out/k8-opt/bin/generator.pb.d \
./bazel-out/k8-opt/bin/instruction.pb.d \
./bazel-out/k8-opt/bin/mutator.pb.d \
./bazel-out/k8-opt/bin/task.pb.d \
./bazel-out/k8-opt/bin/train_budget.pb.d 

OBJS += \
./bazel-out/k8-opt/bin/algorithm.pb.o \
./bazel-out/k8-opt/bin/experiment.pb.o \
./bazel-out/k8-opt/bin/fec_cache.pb.o \
./bazel-out/k8-opt/bin/generator.pb.o \
./bazel-out/k8-opt/bin/instruction.pb.o \
./bazel-out/k8-opt/bin/mutator.pb.o \
./bazel-out/k8-opt/bin/task.pb.o \
./bazel-out/k8-opt/bin/train_budget.pb.o 


# Each subdirectory must supply rules for building sources it contributes
bazel-out/k8-opt/bin/%.o: ../bazel-out/k8-opt/bin/%.cc bazel-out/k8-opt/bin/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C++ Compiler'
	g++ -std=c++17 -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


