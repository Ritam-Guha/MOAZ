################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../bazel-AutoML-Zero/external/bazel_tools/src/main/cpp/util/bazel_log_handler.cc \
../bazel-AutoML-Zero/external/bazel_tools/src/main/cpp/util/errors_posix.cc \
../bazel-AutoML-Zero/external/bazel_tools/src/main/cpp/util/errors_windows.cc \
../bazel-AutoML-Zero/external/bazel_tools/src/main/cpp/util/file.cc \
../bazel-AutoML-Zero/external/bazel_tools/src/main/cpp/util/file_posix.cc \
../bazel-AutoML-Zero/external/bazel_tools/src/main/cpp/util/file_windows.cc \
../bazel-AutoML-Zero/external/bazel_tools/src/main/cpp/util/logging.cc \
../bazel-AutoML-Zero/external/bazel_tools/src/main/cpp/util/md5.cc \
../bazel-AutoML-Zero/external/bazel_tools/src/main/cpp/util/numbers.cc \
../bazel-AutoML-Zero/external/bazel_tools/src/main/cpp/util/path.cc \
../bazel-AutoML-Zero/external/bazel_tools/src/main/cpp/util/path_posix.cc \
../bazel-AutoML-Zero/external/bazel_tools/src/main/cpp/util/path_windows.cc \
../bazel-AutoML-Zero/external/bazel_tools/src/main/cpp/util/port.cc \
../bazel-AutoML-Zero/external/bazel_tools/src/main/cpp/util/strings.cc 

CC_DEPS += \
./bazel-AutoML-Zero/external/bazel_tools/src/main/cpp/util/bazel_log_handler.d \
./bazel-AutoML-Zero/external/bazel_tools/src/main/cpp/util/errors_posix.d \
./bazel-AutoML-Zero/external/bazel_tools/src/main/cpp/util/errors_windows.d \
./bazel-AutoML-Zero/external/bazel_tools/src/main/cpp/util/file.d \
./bazel-AutoML-Zero/external/bazel_tools/src/main/cpp/util/file_posix.d \
./bazel-AutoML-Zero/external/bazel_tools/src/main/cpp/util/file_windows.d \
./bazel-AutoML-Zero/external/bazel_tools/src/main/cpp/util/logging.d \
./bazel-AutoML-Zero/external/bazel_tools/src/main/cpp/util/md5.d \
./bazel-AutoML-Zero/external/bazel_tools/src/main/cpp/util/numbers.d \
./bazel-AutoML-Zero/external/bazel_tools/src/main/cpp/util/path.d \
./bazel-AutoML-Zero/external/bazel_tools/src/main/cpp/util/path_posix.d \
./bazel-AutoML-Zero/external/bazel_tools/src/main/cpp/util/path_windows.d \
./bazel-AutoML-Zero/external/bazel_tools/src/main/cpp/util/port.d \
./bazel-AutoML-Zero/external/bazel_tools/src/main/cpp/util/strings.d 

OBJS += \
./bazel-AutoML-Zero/external/bazel_tools/src/main/cpp/util/bazel_log_handler.o \
./bazel-AutoML-Zero/external/bazel_tools/src/main/cpp/util/errors_posix.o \
./bazel-AutoML-Zero/external/bazel_tools/src/main/cpp/util/errors_windows.o \
./bazel-AutoML-Zero/external/bazel_tools/src/main/cpp/util/file.o \
./bazel-AutoML-Zero/external/bazel_tools/src/main/cpp/util/file_posix.o \
./bazel-AutoML-Zero/external/bazel_tools/src/main/cpp/util/file_windows.o \
./bazel-AutoML-Zero/external/bazel_tools/src/main/cpp/util/logging.o \
./bazel-AutoML-Zero/external/bazel_tools/src/main/cpp/util/md5.o \
./bazel-AutoML-Zero/external/bazel_tools/src/main/cpp/util/numbers.o \
./bazel-AutoML-Zero/external/bazel_tools/src/main/cpp/util/path.o \
./bazel-AutoML-Zero/external/bazel_tools/src/main/cpp/util/path_posix.o \
./bazel-AutoML-Zero/external/bazel_tools/src/main/cpp/util/path_windows.o \
./bazel-AutoML-Zero/external/bazel_tools/src/main/cpp/util/port.o \
./bazel-AutoML-Zero/external/bazel_tools/src/main/cpp/util/strings.o 


# Each subdirectory must supply rules for building sources it contributes
bazel-AutoML-Zero/external/bazel_tools/src/main/cpp/util/%.o: ../bazel-AutoML-Zero/external/bazel_tools/src/main/cpp/util/%.cc bazel-AutoML-Zero/external/bazel_tools/src/main/cpp/util/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C++ Compiler'
	g++ -std=c++17 -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


