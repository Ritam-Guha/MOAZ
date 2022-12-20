################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../bazel-AutoML-Zero/external/local_config_cc/tools/cpp/empty.cc 

CC_DEPS += \
./bazel-AutoML-Zero/external/local_config_cc/tools/cpp/empty.d 

OBJS += \
./bazel-AutoML-Zero/external/local_config_cc/tools/cpp/empty.o 


# Each subdirectory must supply rules for building sources it contributes
bazel-AutoML-Zero/external/local_config_cc/tools/cpp/%.o: ../bazel-AutoML-Zero/external/local_config_cc/tools/cpp/%.cc bazel-AutoML-Zero/external/local_config_cc/tools/cpp/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C++ Compiler'
	g++ -std=c++17 -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


