################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../bazel-AutoML-Zero/external/eigen_archive/bench/tensors/benchmark_main.cc \
../bazel-AutoML-Zero/external/eigen_archive/bench/tensors/contraction_benchmarks_cpu.cc \
../bazel-AutoML-Zero/external/eigen_archive/bench/tensors/tensor_benchmarks_cpu.cc \
../bazel-AutoML-Zero/external/eigen_archive/bench/tensors/tensor_benchmarks_sycl.cc \
../bazel-AutoML-Zero/external/eigen_archive/bench/tensors/tensor_benchmarks_sycl_include_headers.cc 

CC_DEPS += \
./bazel-AutoML-Zero/external/eigen_archive/bench/tensors/benchmark_main.d \
./bazel-AutoML-Zero/external/eigen_archive/bench/tensors/contraction_benchmarks_cpu.d \
./bazel-AutoML-Zero/external/eigen_archive/bench/tensors/tensor_benchmarks_cpu.d \
./bazel-AutoML-Zero/external/eigen_archive/bench/tensors/tensor_benchmarks_sycl.d \
./bazel-AutoML-Zero/external/eigen_archive/bench/tensors/tensor_benchmarks_sycl_include_headers.d 

OBJS += \
./bazel-AutoML-Zero/external/eigen_archive/bench/tensors/benchmark_main.o \
./bazel-AutoML-Zero/external/eigen_archive/bench/tensors/contraction_benchmarks_cpu.o \
./bazel-AutoML-Zero/external/eigen_archive/bench/tensors/tensor_benchmarks_cpu.o \
./bazel-AutoML-Zero/external/eigen_archive/bench/tensors/tensor_benchmarks_sycl.o \
./bazel-AutoML-Zero/external/eigen_archive/bench/tensors/tensor_benchmarks_sycl_include_headers.o 


# Each subdirectory must supply rules for building sources it contributes
bazel-AutoML-Zero/external/eigen_archive/bench/tensors/%.o: ../bazel-AutoML-Zero/external/eigen_archive/bench/tensors/%.cc bazel-AutoML-Zero/external/eigen_archive/bench/tensors/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C++ Compiler'
	g++ -std=c++17 -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


