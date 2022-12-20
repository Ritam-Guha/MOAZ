################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../bazel-AutoML-Zero/external/bazel_tools/src/main/native/windows/file-jni.cc \
../bazel-AutoML-Zero/external/bazel_tools/src/main/native/windows/file.cc \
../bazel-AutoML-Zero/external/bazel_tools/src/main/native/windows/jni-util.cc \
../bazel-AutoML-Zero/external/bazel_tools/src/main/native/windows/memory_pressure_jni.cc \
../bazel-AutoML-Zero/external/bazel_tools/src/main/native/windows/process.cc \
../bazel-AutoML-Zero/external/bazel_tools/src/main/native/windows/processes-jni.cc \
../bazel-AutoML-Zero/external/bazel_tools/src/main/native/windows/sleep_prevention_jni.cc \
../bazel-AutoML-Zero/external/bazel_tools/src/main/native/windows/suspend_counter_jni.cc \
../bazel-AutoML-Zero/external/bazel_tools/src/main/native/windows/util.cc 

CC_DEPS += \
./bazel-AutoML-Zero/external/bazel_tools/src/main/native/windows/file-jni.d \
./bazel-AutoML-Zero/external/bazel_tools/src/main/native/windows/file.d \
./bazel-AutoML-Zero/external/bazel_tools/src/main/native/windows/jni-util.d \
./bazel-AutoML-Zero/external/bazel_tools/src/main/native/windows/memory_pressure_jni.d \
./bazel-AutoML-Zero/external/bazel_tools/src/main/native/windows/process.d \
./bazel-AutoML-Zero/external/bazel_tools/src/main/native/windows/processes-jni.d \
./bazel-AutoML-Zero/external/bazel_tools/src/main/native/windows/sleep_prevention_jni.d \
./bazel-AutoML-Zero/external/bazel_tools/src/main/native/windows/suspend_counter_jni.d \
./bazel-AutoML-Zero/external/bazel_tools/src/main/native/windows/util.d 

OBJS += \
./bazel-AutoML-Zero/external/bazel_tools/src/main/native/windows/file-jni.o \
./bazel-AutoML-Zero/external/bazel_tools/src/main/native/windows/file.o \
./bazel-AutoML-Zero/external/bazel_tools/src/main/native/windows/jni-util.o \
./bazel-AutoML-Zero/external/bazel_tools/src/main/native/windows/memory_pressure_jni.o \
./bazel-AutoML-Zero/external/bazel_tools/src/main/native/windows/process.o \
./bazel-AutoML-Zero/external/bazel_tools/src/main/native/windows/processes-jni.o \
./bazel-AutoML-Zero/external/bazel_tools/src/main/native/windows/sleep_prevention_jni.o \
./bazel-AutoML-Zero/external/bazel_tools/src/main/native/windows/suspend_counter_jni.o \
./bazel-AutoML-Zero/external/bazel_tools/src/main/native/windows/util.o 


# Each subdirectory must supply rules for building sources it contributes
bazel-AutoML-Zero/external/bazel_tools/src/main/native/windows/%.o: ../bazel-AutoML-Zero/external/bazel_tools/src/main/native/windows/%.cc bazel-AutoML-Zero/external/bazel_tools/src/main/native/windows/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C++ Compiler'
	g++ -std=c++17 -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


