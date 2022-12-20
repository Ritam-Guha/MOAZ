################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../bazel-AutoML-Zero/external/com_google_protobuf/src/google/protobuf/compiler/objectivec/objectivec_enum.cc \
../bazel-AutoML-Zero/external/com_google_protobuf/src/google/protobuf/compiler/objectivec/objectivec_enum_field.cc \
../bazel-AutoML-Zero/external/com_google_protobuf/src/google/protobuf/compiler/objectivec/objectivec_extension.cc \
../bazel-AutoML-Zero/external/com_google_protobuf/src/google/protobuf/compiler/objectivec/objectivec_field.cc \
../bazel-AutoML-Zero/external/com_google_protobuf/src/google/protobuf/compiler/objectivec/objectivec_file.cc \
../bazel-AutoML-Zero/external/com_google_protobuf/src/google/protobuf/compiler/objectivec/objectivec_generator.cc \
../bazel-AutoML-Zero/external/com_google_protobuf/src/google/protobuf/compiler/objectivec/objectivec_helpers.cc \
../bazel-AutoML-Zero/external/com_google_protobuf/src/google/protobuf/compiler/objectivec/objectivec_helpers_unittest.cc \
../bazel-AutoML-Zero/external/com_google_protobuf/src/google/protobuf/compiler/objectivec/objectivec_map_field.cc \
../bazel-AutoML-Zero/external/com_google_protobuf/src/google/protobuf/compiler/objectivec/objectivec_message.cc \
../bazel-AutoML-Zero/external/com_google_protobuf/src/google/protobuf/compiler/objectivec/objectivec_message_field.cc \
../bazel-AutoML-Zero/external/com_google_protobuf/src/google/protobuf/compiler/objectivec/objectivec_oneof.cc \
../bazel-AutoML-Zero/external/com_google_protobuf/src/google/protobuf/compiler/objectivec/objectivec_primitive_field.cc 

CC_DEPS += \
./bazel-AutoML-Zero/external/com_google_protobuf/src/google/protobuf/compiler/objectivec/objectivec_enum.d \
./bazel-AutoML-Zero/external/com_google_protobuf/src/google/protobuf/compiler/objectivec/objectivec_enum_field.d \
./bazel-AutoML-Zero/external/com_google_protobuf/src/google/protobuf/compiler/objectivec/objectivec_extension.d \
./bazel-AutoML-Zero/external/com_google_protobuf/src/google/protobuf/compiler/objectivec/objectivec_field.d \
./bazel-AutoML-Zero/external/com_google_protobuf/src/google/protobuf/compiler/objectivec/objectivec_file.d \
./bazel-AutoML-Zero/external/com_google_protobuf/src/google/protobuf/compiler/objectivec/objectivec_generator.d \
./bazel-AutoML-Zero/external/com_google_protobuf/src/google/protobuf/compiler/objectivec/objectivec_helpers.d \
./bazel-AutoML-Zero/external/com_google_protobuf/src/google/protobuf/compiler/objectivec/objectivec_helpers_unittest.d \
./bazel-AutoML-Zero/external/com_google_protobuf/src/google/protobuf/compiler/objectivec/objectivec_map_field.d \
./bazel-AutoML-Zero/external/com_google_protobuf/src/google/protobuf/compiler/objectivec/objectivec_message.d \
./bazel-AutoML-Zero/external/com_google_protobuf/src/google/protobuf/compiler/objectivec/objectivec_message_field.d \
./bazel-AutoML-Zero/external/com_google_protobuf/src/google/protobuf/compiler/objectivec/objectivec_oneof.d \
./bazel-AutoML-Zero/external/com_google_protobuf/src/google/protobuf/compiler/objectivec/objectivec_primitive_field.d 

OBJS += \
./bazel-AutoML-Zero/external/com_google_protobuf/src/google/protobuf/compiler/objectivec/objectivec_enum.o \
./bazel-AutoML-Zero/external/com_google_protobuf/src/google/protobuf/compiler/objectivec/objectivec_enum_field.o \
./bazel-AutoML-Zero/external/com_google_protobuf/src/google/protobuf/compiler/objectivec/objectivec_extension.o \
./bazel-AutoML-Zero/external/com_google_protobuf/src/google/protobuf/compiler/objectivec/objectivec_field.o \
./bazel-AutoML-Zero/external/com_google_protobuf/src/google/protobuf/compiler/objectivec/objectivec_file.o \
./bazel-AutoML-Zero/external/com_google_protobuf/src/google/protobuf/compiler/objectivec/objectivec_generator.o \
./bazel-AutoML-Zero/external/com_google_protobuf/src/google/protobuf/compiler/objectivec/objectivec_helpers.o \
./bazel-AutoML-Zero/external/com_google_protobuf/src/google/protobuf/compiler/objectivec/objectivec_helpers_unittest.o \
./bazel-AutoML-Zero/external/com_google_protobuf/src/google/protobuf/compiler/objectivec/objectivec_map_field.o \
./bazel-AutoML-Zero/external/com_google_protobuf/src/google/protobuf/compiler/objectivec/objectivec_message.o \
./bazel-AutoML-Zero/external/com_google_protobuf/src/google/protobuf/compiler/objectivec/objectivec_message_field.o \
./bazel-AutoML-Zero/external/com_google_protobuf/src/google/protobuf/compiler/objectivec/objectivec_oneof.o \
./bazel-AutoML-Zero/external/com_google_protobuf/src/google/protobuf/compiler/objectivec/objectivec_primitive_field.o 


# Each subdirectory must supply rules for building sources it contributes
bazel-AutoML-Zero/external/com_google_protobuf/src/google/protobuf/compiler/objectivec/%.o: ../bazel-AutoML-Zero/external/com_google_protobuf/src/google/protobuf/compiler/objectivec/%.cc bazel-AutoML-Zero/external/com_google_protobuf/src/google/protobuf/compiler/objectivec/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C++ Compiler'
	g++ -std=c++17 -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


