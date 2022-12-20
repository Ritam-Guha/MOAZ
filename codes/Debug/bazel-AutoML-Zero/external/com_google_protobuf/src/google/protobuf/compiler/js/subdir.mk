################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../bazel-AutoML-Zero/external/com_google_protobuf/src/google/protobuf/compiler/js/js_generator.cc \
../bazel-AutoML-Zero/external/com_google_protobuf/src/google/protobuf/compiler/js/well_known_types_embed.cc 

CC_DEPS += \
./bazel-AutoML-Zero/external/com_google_protobuf/src/google/protobuf/compiler/js/js_generator.d \
./bazel-AutoML-Zero/external/com_google_protobuf/src/google/protobuf/compiler/js/well_known_types_embed.d 

OBJS += \
./bazel-AutoML-Zero/external/com_google_protobuf/src/google/protobuf/compiler/js/js_generator.o \
./bazel-AutoML-Zero/external/com_google_protobuf/src/google/protobuf/compiler/js/well_known_types_embed.o 


# Each subdirectory must supply rules for building sources it contributes
bazel-AutoML-Zero/external/com_google_protobuf/src/google/protobuf/compiler/js/%.o: ../bazel-AutoML-Zero/external/com_google_protobuf/src/google/protobuf/compiler/js/%.cc bazel-AutoML-Zero/external/com_google_protobuf/src/google/protobuf/compiler/js/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C++ Compiler'
	g++ -std=c++17 -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


