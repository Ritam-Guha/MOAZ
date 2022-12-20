################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../bazel-AutoML-Zero/external/com_google_absl/absl/functional/bind_front_test.cc \
../bazel-AutoML-Zero/external/com_google_absl/absl/functional/function_ref_benchmark.cc \
../bazel-AutoML-Zero/external/com_google_absl/absl/functional/function_ref_test.cc 

CC_DEPS += \
./bazel-AutoML-Zero/external/com_google_absl/absl/functional/bind_front_test.d \
./bazel-AutoML-Zero/external/com_google_absl/absl/functional/function_ref_benchmark.d \
./bazel-AutoML-Zero/external/com_google_absl/absl/functional/function_ref_test.d 

OBJS += \
./bazel-AutoML-Zero/external/com_google_absl/absl/functional/bind_front_test.o \
./bazel-AutoML-Zero/external/com_google_absl/absl/functional/function_ref_benchmark.o \
./bazel-AutoML-Zero/external/com_google_absl/absl/functional/function_ref_test.o 


# Each subdirectory must supply rules for building sources it contributes
bazel-AutoML-Zero/external/com_google_absl/absl/functional/%.o: ../bazel-AutoML-Zero/external/com_google_absl/absl/functional/%.cc bazel-AutoML-Zero/external/com_google_absl/absl/functional/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C++ Compiler'
	g++ -std=c++17 -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


