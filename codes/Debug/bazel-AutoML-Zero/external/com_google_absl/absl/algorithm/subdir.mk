################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../bazel-AutoML-Zero/external/com_google_absl/absl/algorithm/algorithm_test.cc \
../bazel-AutoML-Zero/external/com_google_absl/absl/algorithm/container_test.cc \
../bazel-AutoML-Zero/external/com_google_absl/absl/algorithm/equal_benchmark.cc 

CC_DEPS += \
./bazel-AutoML-Zero/external/com_google_absl/absl/algorithm/algorithm_test.d \
./bazel-AutoML-Zero/external/com_google_absl/absl/algorithm/container_test.d \
./bazel-AutoML-Zero/external/com_google_absl/absl/algorithm/equal_benchmark.d 

OBJS += \
./bazel-AutoML-Zero/external/com_google_absl/absl/algorithm/algorithm_test.o \
./bazel-AutoML-Zero/external/com_google_absl/absl/algorithm/container_test.o \
./bazel-AutoML-Zero/external/com_google_absl/absl/algorithm/equal_benchmark.o 


# Each subdirectory must supply rules for building sources it contributes
bazel-AutoML-Zero/external/com_google_absl/absl/algorithm/%.o: ../bazel-AutoML-Zero/external/com_google_absl/absl/algorithm/%.cc bazel-AutoML-Zero/external/com_google_absl/absl/algorithm/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C++ Compiler'
	g++ -std=c++17 -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


