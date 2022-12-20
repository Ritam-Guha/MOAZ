################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CPP_SRCS += \
../bazel-AutoML-Zero/external/eigen_archive/bench/spbench/sp_solver.cpp \
../bazel-AutoML-Zero/external/eigen_archive/bench/spbench/spbenchsolver.cpp \
../bazel-AutoML-Zero/external/eigen_archive/bench/spbench/test_sparseLU.cpp 

OBJS += \
./bazel-AutoML-Zero/external/eigen_archive/bench/spbench/sp_solver.o \
./bazel-AutoML-Zero/external/eigen_archive/bench/spbench/spbenchsolver.o \
./bazel-AutoML-Zero/external/eigen_archive/bench/spbench/test_sparseLU.o 

CPP_DEPS += \
./bazel-AutoML-Zero/external/eigen_archive/bench/spbench/sp_solver.d \
./bazel-AutoML-Zero/external/eigen_archive/bench/spbench/spbenchsolver.d \
./bazel-AutoML-Zero/external/eigen_archive/bench/spbench/test_sparseLU.d 


# Each subdirectory must supply rules for building sources it contributes
bazel-AutoML-Zero/external/eigen_archive/bench/spbench/%.o: ../bazel-AutoML-Zero/external/eigen_archive/bench/spbench/%.cpp bazel-AutoML-Zero/external/eigen_archive/bench/spbench/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C++ Compiler'
	g++ -std=c++17 -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


