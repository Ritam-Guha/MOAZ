################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../bazel-AutoML-Zero/external/com_google_absl/absl/memory/memory_exception_safety_test.cc \
../bazel-AutoML-Zero/external/com_google_absl/absl/memory/memory_test.cc 

CC_DEPS += \
./bazel-AutoML-Zero/external/com_google_absl/absl/memory/memory_exception_safety_test.d \
./bazel-AutoML-Zero/external/com_google_absl/absl/memory/memory_test.d 

OBJS += \
./bazel-AutoML-Zero/external/com_google_absl/absl/memory/memory_exception_safety_test.o \
./bazel-AutoML-Zero/external/com_google_absl/absl/memory/memory_test.o 


# Each subdirectory must supply rules for building sources it contributes
bazel-AutoML-Zero/external/com_google_absl/absl/memory/%.o: ../bazel-AutoML-Zero/external/com_google_absl/absl/memory/%.cc bazel-AutoML-Zero/external/com_google_absl/absl/memory/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C++ Compiler'
	g++ -std=c++17 -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


