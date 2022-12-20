################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../bazel-AutoML-Zero/external/com_google_protobuf/src/google/protobuf/compiler/annotation_test_util.cc \
../bazel-AutoML-Zero/external/com_google_protobuf/src/google/protobuf/compiler/code_generator.cc \
../bazel-AutoML-Zero/external/com_google_protobuf/src/google/protobuf/compiler/command_line_interface.cc \
../bazel-AutoML-Zero/external/com_google_protobuf/src/google/protobuf/compiler/command_line_interface_unittest.cc \
../bazel-AutoML-Zero/external/com_google_protobuf/src/google/protobuf/compiler/importer.cc \
../bazel-AutoML-Zero/external/com_google_protobuf/src/google/protobuf/compiler/importer_unittest.cc \
../bazel-AutoML-Zero/external/com_google_protobuf/src/google/protobuf/compiler/main.cc \
../bazel-AutoML-Zero/external/com_google_protobuf/src/google/protobuf/compiler/mock_code_generator.cc \
../bazel-AutoML-Zero/external/com_google_protobuf/src/google/protobuf/compiler/parser.cc \
../bazel-AutoML-Zero/external/com_google_protobuf/src/google/protobuf/compiler/parser_unittest.cc \
../bazel-AutoML-Zero/external/com_google_protobuf/src/google/protobuf/compiler/plugin.cc \
../bazel-AutoML-Zero/external/com_google_protobuf/src/google/protobuf/compiler/plugin.pb.cc \
../bazel-AutoML-Zero/external/com_google_protobuf/src/google/protobuf/compiler/subprocess.cc \
../bazel-AutoML-Zero/external/com_google_protobuf/src/google/protobuf/compiler/test_plugin.cc \
../bazel-AutoML-Zero/external/com_google_protobuf/src/google/protobuf/compiler/zip_writer.cc 

CC_DEPS += \
./bazel-AutoML-Zero/external/com_google_protobuf/src/google/protobuf/compiler/annotation_test_util.d \
./bazel-AutoML-Zero/external/com_google_protobuf/src/google/protobuf/compiler/code_generator.d \
./bazel-AutoML-Zero/external/com_google_protobuf/src/google/protobuf/compiler/command_line_interface.d \
./bazel-AutoML-Zero/external/com_google_protobuf/src/google/protobuf/compiler/command_line_interface_unittest.d \
./bazel-AutoML-Zero/external/com_google_protobuf/src/google/protobuf/compiler/importer.d \
./bazel-AutoML-Zero/external/com_google_protobuf/src/google/protobuf/compiler/importer_unittest.d \
./bazel-AutoML-Zero/external/com_google_protobuf/src/google/protobuf/compiler/main.d \
./bazel-AutoML-Zero/external/com_google_protobuf/src/google/protobuf/compiler/mock_code_generator.d \
./bazel-AutoML-Zero/external/com_google_protobuf/src/google/protobuf/compiler/parser.d \
./bazel-AutoML-Zero/external/com_google_protobuf/src/google/protobuf/compiler/parser_unittest.d \
./bazel-AutoML-Zero/external/com_google_protobuf/src/google/protobuf/compiler/plugin.d \
./bazel-AutoML-Zero/external/com_google_protobuf/src/google/protobuf/compiler/plugin.pb.d \
./bazel-AutoML-Zero/external/com_google_protobuf/src/google/protobuf/compiler/subprocess.d \
./bazel-AutoML-Zero/external/com_google_protobuf/src/google/protobuf/compiler/test_plugin.d \
./bazel-AutoML-Zero/external/com_google_protobuf/src/google/protobuf/compiler/zip_writer.d 

OBJS += \
./bazel-AutoML-Zero/external/com_google_protobuf/src/google/protobuf/compiler/annotation_test_util.o \
./bazel-AutoML-Zero/external/com_google_protobuf/src/google/protobuf/compiler/code_generator.o \
./bazel-AutoML-Zero/external/com_google_protobuf/src/google/protobuf/compiler/command_line_interface.o \
./bazel-AutoML-Zero/external/com_google_protobuf/src/google/protobuf/compiler/command_line_interface_unittest.o \
./bazel-AutoML-Zero/external/com_google_protobuf/src/google/protobuf/compiler/importer.o \
./bazel-AutoML-Zero/external/com_google_protobuf/src/google/protobuf/compiler/importer_unittest.o \
./bazel-AutoML-Zero/external/com_google_protobuf/src/google/protobuf/compiler/main.o \
./bazel-AutoML-Zero/external/com_google_protobuf/src/google/protobuf/compiler/mock_code_generator.o \
./bazel-AutoML-Zero/external/com_google_protobuf/src/google/protobuf/compiler/parser.o \
./bazel-AutoML-Zero/external/com_google_protobuf/src/google/protobuf/compiler/parser_unittest.o \
./bazel-AutoML-Zero/external/com_google_protobuf/src/google/protobuf/compiler/plugin.o \
./bazel-AutoML-Zero/external/com_google_protobuf/src/google/protobuf/compiler/plugin.pb.o \
./bazel-AutoML-Zero/external/com_google_protobuf/src/google/protobuf/compiler/subprocess.o \
./bazel-AutoML-Zero/external/com_google_protobuf/src/google/protobuf/compiler/test_plugin.o \
./bazel-AutoML-Zero/external/com_google_protobuf/src/google/protobuf/compiler/zip_writer.o 


# Each subdirectory must supply rules for building sources it contributes
bazel-AutoML-Zero/external/com_google_protobuf/src/google/protobuf/compiler/%.o: ../bazel-AutoML-Zero/external/com_google_protobuf/src/google/protobuf/compiler/%.cc bazel-AutoML-Zero/external/com_google_protobuf/src/google/protobuf/compiler/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C++ Compiler'
	g++ -std=c++17 -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


