################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../bazel-AutoML-Zero/external/com_google_protobuf/src/google/protobuf/util/delimited_message_util.cc \
../bazel-AutoML-Zero/external/com_google_protobuf/src/google/protobuf/util/delimited_message_util_test.cc \
../bazel-AutoML-Zero/external/com_google_protobuf/src/google/protobuf/util/field_comparator.cc \
../bazel-AutoML-Zero/external/com_google_protobuf/src/google/protobuf/util/field_comparator_test.cc \
../bazel-AutoML-Zero/external/com_google_protobuf/src/google/protobuf/util/field_mask_util.cc \
../bazel-AutoML-Zero/external/com_google_protobuf/src/google/protobuf/util/field_mask_util_test.cc \
../bazel-AutoML-Zero/external/com_google_protobuf/src/google/protobuf/util/json_util.cc \
../bazel-AutoML-Zero/external/com_google_protobuf/src/google/protobuf/util/json_util_test.cc \
../bazel-AutoML-Zero/external/com_google_protobuf/src/google/protobuf/util/message_differencer.cc \
../bazel-AutoML-Zero/external/com_google_protobuf/src/google/protobuf/util/message_differencer_unittest.cc \
../bazel-AutoML-Zero/external/com_google_protobuf/src/google/protobuf/util/time_util.cc \
../bazel-AutoML-Zero/external/com_google_protobuf/src/google/protobuf/util/time_util_test.cc \
../bazel-AutoML-Zero/external/com_google_protobuf/src/google/protobuf/util/type_resolver_util.cc \
../bazel-AutoML-Zero/external/com_google_protobuf/src/google/protobuf/util/type_resolver_util_test.cc 

CC_DEPS += \
./bazel-AutoML-Zero/external/com_google_protobuf/src/google/protobuf/util/delimited_message_util.d \
./bazel-AutoML-Zero/external/com_google_protobuf/src/google/protobuf/util/delimited_message_util_test.d \
./bazel-AutoML-Zero/external/com_google_protobuf/src/google/protobuf/util/field_comparator.d \
./bazel-AutoML-Zero/external/com_google_protobuf/src/google/protobuf/util/field_comparator_test.d \
./bazel-AutoML-Zero/external/com_google_protobuf/src/google/protobuf/util/field_mask_util.d \
./bazel-AutoML-Zero/external/com_google_protobuf/src/google/protobuf/util/field_mask_util_test.d \
./bazel-AutoML-Zero/external/com_google_protobuf/src/google/protobuf/util/json_util.d \
./bazel-AutoML-Zero/external/com_google_protobuf/src/google/protobuf/util/json_util_test.d \
./bazel-AutoML-Zero/external/com_google_protobuf/src/google/protobuf/util/message_differencer.d \
./bazel-AutoML-Zero/external/com_google_protobuf/src/google/protobuf/util/message_differencer_unittest.d \
./bazel-AutoML-Zero/external/com_google_protobuf/src/google/protobuf/util/time_util.d \
./bazel-AutoML-Zero/external/com_google_protobuf/src/google/protobuf/util/time_util_test.d \
./bazel-AutoML-Zero/external/com_google_protobuf/src/google/protobuf/util/type_resolver_util.d \
./bazel-AutoML-Zero/external/com_google_protobuf/src/google/protobuf/util/type_resolver_util_test.d 

OBJS += \
./bazel-AutoML-Zero/external/com_google_protobuf/src/google/protobuf/util/delimited_message_util.o \
./bazel-AutoML-Zero/external/com_google_protobuf/src/google/protobuf/util/delimited_message_util_test.o \
./bazel-AutoML-Zero/external/com_google_protobuf/src/google/protobuf/util/field_comparator.o \
./bazel-AutoML-Zero/external/com_google_protobuf/src/google/protobuf/util/field_comparator_test.o \
./bazel-AutoML-Zero/external/com_google_protobuf/src/google/protobuf/util/field_mask_util.o \
./bazel-AutoML-Zero/external/com_google_protobuf/src/google/protobuf/util/field_mask_util_test.o \
./bazel-AutoML-Zero/external/com_google_protobuf/src/google/protobuf/util/json_util.o \
./bazel-AutoML-Zero/external/com_google_protobuf/src/google/protobuf/util/json_util_test.o \
./bazel-AutoML-Zero/external/com_google_protobuf/src/google/protobuf/util/message_differencer.o \
./bazel-AutoML-Zero/external/com_google_protobuf/src/google/protobuf/util/message_differencer_unittest.o \
./bazel-AutoML-Zero/external/com_google_protobuf/src/google/protobuf/util/time_util.o \
./bazel-AutoML-Zero/external/com_google_protobuf/src/google/protobuf/util/time_util_test.o \
./bazel-AutoML-Zero/external/com_google_protobuf/src/google/protobuf/util/type_resolver_util.o \
./bazel-AutoML-Zero/external/com_google_protobuf/src/google/protobuf/util/type_resolver_util_test.o 


# Each subdirectory must supply rules for building sources it contributes
bazel-AutoML-Zero/external/com_google_protobuf/src/google/protobuf/util/%.o: ../bazel-AutoML-Zero/external/com_google_protobuf/src/google/protobuf/util/%.cc bazel-AutoML-Zero/external/com_google_protobuf/src/google/protobuf/util/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C++ Compiler'
	g++ -std=c++17 -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


