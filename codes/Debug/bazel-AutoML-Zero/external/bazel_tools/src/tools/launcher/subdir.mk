################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../bazel-AutoML-Zero/external/bazel_tools/src/tools/launcher/bash_launcher.cc \
../bazel-AutoML-Zero/external/bazel_tools/src/tools/launcher/dummy.cc \
../bazel-AutoML-Zero/external/bazel_tools/src/tools/launcher/java_launcher.cc \
../bazel-AutoML-Zero/external/bazel_tools/src/tools/launcher/launcher.cc \
../bazel-AutoML-Zero/external/bazel_tools/src/tools/launcher/launcher_main.cc \
../bazel-AutoML-Zero/external/bazel_tools/src/tools/launcher/python_launcher.cc 

CC_DEPS += \
./bazel-AutoML-Zero/external/bazel_tools/src/tools/launcher/bash_launcher.d \
./bazel-AutoML-Zero/external/bazel_tools/src/tools/launcher/dummy.d \
./bazel-AutoML-Zero/external/bazel_tools/src/tools/launcher/java_launcher.d \
./bazel-AutoML-Zero/external/bazel_tools/src/tools/launcher/launcher.d \
./bazel-AutoML-Zero/external/bazel_tools/src/tools/launcher/launcher_main.d \
./bazel-AutoML-Zero/external/bazel_tools/src/tools/launcher/python_launcher.d 

OBJS += \
./bazel-AutoML-Zero/external/bazel_tools/src/tools/launcher/bash_launcher.o \
./bazel-AutoML-Zero/external/bazel_tools/src/tools/launcher/dummy.o \
./bazel-AutoML-Zero/external/bazel_tools/src/tools/launcher/java_launcher.o \
./bazel-AutoML-Zero/external/bazel_tools/src/tools/launcher/launcher.o \
./bazel-AutoML-Zero/external/bazel_tools/src/tools/launcher/launcher_main.o \
./bazel-AutoML-Zero/external/bazel_tools/src/tools/launcher/python_launcher.o 


# Each subdirectory must supply rules for building sources it contributes
bazel-AutoML-Zero/external/bazel_tools/src/tools/launcher/%.o: ../bazel-AutoML-Zero/external/bazel_tools/src/tools/launcher/%.cc bazel-AutoML-Zero/external/bazel_tools/src/tools/launcher/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C++ Compiler'
	g++ -std=c++17 -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


