################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../bazel-AutoML-Zero/external/bazel_tools/src/tools/launcher/util/data_parser.cc \
../bazel-AutoML-Zero/external/bazel_tools/src/tools/launcher/util/data_parser_test.cc \
../bazel-AutoML-Zero/external/bazel_tools/src/tools/launcher/util/dummy.cc \
../bazel-AutoML-Zero/external/bazel_tools/src/tools/launcher/util/launcher_util.cc \
../bazel-AutoML-Zero/external/bazel_tools/src/tools/launcher/util/launcher_util_test.cc 

CC_DEPS += \
./bazel-AutoML-Zero/external/bazel_tools/src/tools/launcher/util/data_parser.d \
./bazel-AutoML-Zero/external/bazel_tools/src/tools/launcher/util/data_parser_test.d \
./bazel-AutoML-Zero/external/bazel_tools/src/tools/launcher/util/dummy.d \
./bazel-AutoML-Zero/external/bazel_tools/src/tools/launcher/util/launcher_util.d \
./bazel-AutoML-Zero/external/bazel_tools/src/tools/launcher/util/launcher_util_test.d 

OBJS += \
./bazel-AutoML-Zero/external/bazel_tools/src/tools/launcher/util/data_parser.o \
./bazel-AutoML-Zero/external/bazel_tools/src/tools/launcher/util/data_parser_test.o \
./bazel-AutoML-Zero/external/bazel_tools/src/tools/launcher/util/dummy.o \
./bazel-AutoML-Zero/external/bazel_tools/src/tools/launcher/util/launcher_util.o \
./bazel-AutoML-Zero/external/bazel_tools/src/tools/launcher/util/launcher_util_test.o 


# Each subdirectory must supply rules for building sources it contributes
bazel-AutoML-Zero/external/bazel_tools/src/tools/launcher/util/%.o: ../bazel-AutoML-Zero/external/bazel_tools/src/tools/launcher/util/%.cc bazel-AutoML-Zero/external/bazel_tools/src/tools/launcher/util/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C++ Compiler'
	g++ -std=c++17 -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


