################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../bazel-AutoML-Zero/external/com_google_absl/absl/container/btree_benchmark.cc \
../bazel-AutoML-Zero/external/com_google_absl/absl/container/btree_test.cc \
../bazel-AutoML-Zero/external/com_google_absl/absl/container/fixed_array_benchmark.cc \
../bazel-AutoML-Zero/external/com_google_absl/absl/container/fixed_array_exception_safety_test.cc \
../bazel-AutoML-Zero/external/com_google_absl/absl/container/fixed_array_test.cc \
../bazel-AutoML-Zero/external/com_google_absl/absl/container/flat_hash_map_test.cc \
../bazel-AutoML-Zero/external/com_google_absl/absl/container/flat_hash_set_test.cc \
../bazel-AutoML-Zero/external/com_google_absl/absl/container/inlined_vector_benchmark.cc \
../bazel-AutoML-Zero/external/com_google_absl/absl/container/inlined_vector_exception_safety_test.cc \
../bazel-AutoML-Zero/external/com_google_absl/absl/container/inlined_vector_test.cc \
../bazel-AutoML-Zero/external/com_google_absl/absl/container/node_hash_map_test.cc \
../bazel-AutoML-Zero/external/com_google_absl/absl/container/node_hash_set_test.cc 

CC_DEPS += \
./bazel-AutoML-Zero/external/com_google_absl/absl/container/btree_benchmark.d \
./bazel-AutoML-Zero/external/com_google_absl/absl/container/btree_test.d \
./bazel-AutoML-Zero/external/com_google_absl/absl/container/fixed_array_benchmark.d \
./bazel-AutoML-Zero/external/com_google_absl/absl/container/fixed_array_exception_safety_test.d \
./bazel-AutoML-Zero/external/com_google_absl/absl/container/fixed_array_test.d \
./bazel-AutoML-Zero/external/com_google_absl/absl/container/flat_hash_map_test.d \
./bazel-AutoML-Zero/external/com_google_absl/absl/container/flat_hash_set_test.d \
./bazel-AutoML-Zero/external/com_google_absl/absl/container/inlined_vector_benchmark.d \
./bazel-AutoML-Zero/external/com_google_absl/absl/container/inlined_vector_exception_safety_test.d \
./bazel-AutoML-Zero/external/com_google_absl/absl/container/inlined_vector_test.d \
./bazel-AutoML-Zero/external/com_google_absl/absl/container/node_hash_map_test.d \
./bazel-AutoML-Zero/external/com_google_absl/absl/container/node_hash_set_test.d 

OBJS += \
./bazel-AutoML-Zero/external/com_google_absl/absl/container/btree_benchmark.o \
./bazel-AutoML-Zero/external/com_google_absl/absl/container/btree_test.o \
./bazel-AutoML-Zero/external/com_google_absl/absl/container/fixed_array_benchmark.o \
./bazel-AutoML-Zero/external/com_google_absl/absl/container/fixed_array_exception_safety_test.o \
./bazel-AutoML-Zero/external/com_google_absl/absl/container/fixed_array_test.o \
./bazel-AutoML-Zero/external/com_google_absl/absl/container/flat_hash_map_test.o \
./bazel-AutoML-Zero/external/com_google_absl/absl/container/flat_hash_set_test.o \
./bazel-AutoML-Zero/external/com_google_absl/absl/container/inlined_vector_benchmark.o \
./bazel-AutoML-Zero/external/com_google_absl/absl/container/inlined_vector_exception_safety_test.o \
./bazel-AutoML-Zero/external/com_google_absl/absl/container/inlined_vector_test.o \
./bazel-AutoML-Zero/external/com_google_absl/absl/container/node_hash_map_test.o \
./bazel-AutoML-Zero/external/com_google_absl/absl/container/node_hash_set_test.o 


# Each subdirectory must supply rules for building sources it contributes
bazel-AutoML-Zero/external/com_google_absl/absl/container/%.o: ../bazel-AutoML-Zero/external/com_google_absl/absl/container/%.cc bazel-AutoML-Zero/external/com_google_absl/absl/container/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C++ Compiler'
	g++ -std=c++17 -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


