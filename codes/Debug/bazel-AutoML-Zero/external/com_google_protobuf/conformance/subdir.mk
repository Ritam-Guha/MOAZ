################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../bazel-AutoML-Zero/external/com_google_protobuf/conformance/binary_json_conformance_suite.cc \
../bazel-AutoML-Zero/external/com_google_protobuf/conformance/conformance_cpp.cc \
../bazel-AutoML-Zero/external/com_google_protobuf/conformance/conformance_test.cc \
../bazel-AutoML-Zero/external/com_google_protobuf/conformance/conformance_test_main.cc \
../bazel-AutoML-Zero/external/com_google_protobuf/conformance/conformance_test_runner.cc \
../bazel-AutoML-Zero/external/com_google_protobuf/conformance/text_format_conformance_suite.cc 

CC_DEPS += \
./bazel-AutoML-Zero/external/com_google_protobuf/conformance/binary_json_conformance_suite.d \
./bazel-AutoML-Zero/external/com_google_protobuf/conformance/conformance_cpp.d \
./bazel-AutoML-Zero/external/com_google_protobuf/conformance/conformance_test.d \
./bazel-AutoML-Zero/external/com_google_protobuf/conformance/conformance_test_main.d \
./bazel-AutoML-Zero/external/com_google_protobuf/conformance/conformance_test_runner.d \
./bazel-AutoML-Zero/external/com_google_protobuf/conformance/text_format_conformance_suite.d 

OBJS += \
./bazel-AutoML-Zero/external/com_google_protobuf/conformance/binary_json_conformance_suite.o \
./bazel-AutoML-Zero/external/com_google_protobuf/conformance/conformance_cpp.o \
./bazel-AutoML-Zero/external/com_google_protobuf/conformance/conformance_test.o \
./bazel-AutoML-Zero/external/com_google_protobuf/conformance/conformance_test_main.o \
./bazel-AutoML-Zero/external/com_google_protobuf/conformance/conformance_test_runner.o \
./bazel-AutoML-Zero/external/com_google_protobuf/conformance/text_format_conformance_suite.o 


# Each subdirectory must supply rules for building sources it contributes
bazel-AutoML-Zero/external/com_google_protobuf/conformance/%.o: ../bazel-AutoML-Zero/external/com_google_protobuf/conformance/%.cc bazel-AutoML-Zero/external/com_google_protobuf/conformance/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C++ Compiler'
	g++ -std=c++17 -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


