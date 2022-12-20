################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../bazel-AutoML-Zero/external/com_google_protobuf/src/google/protobuf/compiler/php/php_generator.cc 

CC_DEPS += \
./bazel-AutoML-Zero/external/com_google_protobuf/src/google/protobuf/compiler/php/php_generator.d 

OBJS += \
./bazel-AutoML-Zero/external/com_google_protobuf/src/google/protobuf/compiler/php/php_generator.o 


# Each subdirectory must supply rules for building sources it contributes
bazel-AutoML-Zero/external/com_google_protobuf/src/google/protobuf/compiler/php/%.o: ../bazel-AutoML-Zero/external/com_google_protobuf/src/google/protobuf/compiler/php/%.cc bazel-AutoML-Zero/external/com_google_protobuf/src/google/protobuf/compiler/php/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C++ Compiler'
	g++ -std=c++17 -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


