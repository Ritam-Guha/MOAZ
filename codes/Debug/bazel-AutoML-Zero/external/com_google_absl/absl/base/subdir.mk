################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../bazel-AutoML-Zero/external/com_google_absl/absl/base/bit_cast_test.cc \
../bazel-AutoML-Zero/external/com_google_absl/absl/base/call_once_test.cc \
../bazel-AutoML-Zero/external/com_google_absl/absl/base/config_test.cc \
../bazel-AutoML-Zero/external/com_google_absl/absl/base/exception_safety_testing_test.cc \
../bazel-AutoML-Zero/external/com_google_absl/absl/base/inline_variable_test.cc \
../bazel-AutoML-Zero/external/com_google_absl/absl/base/inline_variable_test_a.cc \
../bazel-AutoML-Zero/external/com_google_absl/absl/base/inline_variable_test_b.cc \
../bazel-AutoML-Zero/external/com_google_absl/absl/base/invoke_test.cc \
../bazel-AutoML-Zero/external/com_google_absl/absl/base/log_severity.cc \
../bazel-AutoML-Zero/external/com_google_absl/absl/base/log_severity_test.cc \
../bazel-AutoML-Zero/external/com_google_absl/absl/base/optimization_test.cc \
../bazel-AutoML-Zero/external/com_google_absl/absl/base/raw_logging_test.cc \
../bazel-AutoML-Zero/external/com_google_absl/absl/base/spinlock_test_common.cc \
../bazel-AutoML-Zero/external/com_google_absl/absl/base/throw_delegate_test.cc 

CC_DEPS += \
./bazel-AutoML-Zero/external/com_google_absl/absl/base/bit_cast_test.d \
./bazel-AutoML-Zero/external/com_google_absl/absl/base/call_once_test.d \
./bazel-AutoML-Zero/external/com_google_absl/absl/base/config_test.d \
./bazel-AutoML-Zero/external/com_google_absl/absl/base/exception_safety_testing_test.d \
./bazel-AutoML-Zero/external/com_google_absl/absl/base/inline_variable_test.d \
./bazel-AutoML-Zero/external/com_google_absl/absl/base/inline_variable_test_a.d \
./bazel-AutoML-Zero/external/com_google_absl/absl/base/inline_variable_test_b.d \
./bazel-AutoML-Zero/external/com_google_absl/absl/base/invoke_test.d \
./bazel-AutoML-Zero/external/com_google_absl/absl/base/log_severity.d \
./bazel-AutoML-Zero/external/com_google_absl/absl/base/log_severity_test.d \
./bazel-AutoML-Zero/external/com_google_absl/absl/base/optimization_test.d \
./bazel-AutoML-Zero/external/com_google_absl/absl/base/raw_logging_test.d \
./bazel-AutoML-Zero/external/com_google_absl/absl/base/spinlock_test_common.d \
./bazel-AutoML-Zero/external/com_google_absl/absl/base/throw_delegate_test.d 

OBJS += \
./bazel-AutoML-Zero/external/com_google_absl/absl/base/bit_cast_test.o \
./bazel-AutoML-Zero/external/com_google_absl/absl/base/call_once_test.o \
./bazel-AutoML-Zero/external/com_google_absl/absl/base/config_test.o \
./bazel-AutoML-Zero/external/com_google_absl/absl/base/exception_safety_testing_test.o \
./bazel-AutoML-Zero/external/com_google_absl/absl/base/inline_variable_test.o \
./bazel-AutoML-Zero/external/com_google_absl/absl/base/inline_variable_test_a.o \
./bazel-AutoML-Zero/external/com_google_absl/absl/base/inline_variable_test_b.o \
./bazel-AutoML-Zero/external/com_google_absl/absl/base/invoke_test.o \
./bazel-AutoML-Zero/external/com_google_absl/absl/base/log_severity.o \
./bazel-AutoML-Zero/external/com_google_absl/absl/base/log_severity_test.o \
./bazel-AutoML-Zero/external/com_google_absl/absl/base/optimization_test.o \
./bazel-AutoML-Zero/external/com_google_absl/absl/base/raw_logging_test.o \
./bazel-AutoML-Zero/external/com_google_absl/absl/base/spinlock_test_common.o \
./bazel-AutoML-Zero/external/com_google_absl/absl/base/throw_delegate_test.o 


# Each subdirectory must supply rules for building sources it contributes
bazel-AutoML-Zero/external/com_google_absl/absl/base/%.o: ../bazel-AutoML-Zero/external/com_google_absl/absl/base/%.cc bazel-AutoML-Zero/external/com_google_absl/absl/base/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C++ Compiler'
	g++ -std=c++17 -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


