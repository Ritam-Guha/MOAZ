################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../bazel-AutoML-Zero/external/bazel_tools/third_party/ijar/mapped_file_unix.cc \
../bazel-AutoML-Zero/external/bazel_tools/third_party/ijar/platform_utils.cc \
../bazel-AutoML-Zero/external/bazel_tools/third_party/ijar/zip.cc \
../bazel-AutoML-Zero/external/bazel_tools/third_party/ijar/zip_main.cc \
../bazel-AutoML-Zero/external/bazel_tools/third_party/ijar/zlib_client.cc 

CC_DEPS += \
./bazel-AutoML-Zero/external/bazel_tools/third_party/ijar/mapped_file_unix.d \
./bazel-AutoML-Zero/external/bazel_tools/third_party/ijar/platform_utils.d \
./bazel-AutoML-Zero/external/bazel_tools/third_party/ijar/zip.d \
./bazel-AutoML-Zero/external/bazel_tools/third_party/ijar/zip_main.d \
./bazel-AutoML-Zero/external/bazel_tools/third_party/ijar/zlib_client.d 

OBJS += \
./bazel-AutoML-Zero/external/bazel_tools/third_party/ijar/mapped_file_unix.o \
./bazel-AutoML-Zero/external/bazel_tools/third_party/ijar/platform_utils.o \
./bazel-AutoML-Zero/external/bazel_tools/third_party/ijar/zip.o \
./bazel-AutoML-Zero/external/bazel_tools/third_party/ijar/zip_main.o \
./bazel-AutoML-Zero/external/bazel_tools/third_party/ijar/zlib_client.o 


# Each subdirectory must supply rules for building sources it contributes
bazel-AutoML-Zero/external/bazel_tools/third_party/ijar/%.o: ../bazel-AutoML-Zero/external/bazel_tools/third_party/ijar/%.cc bazel-AutoML-Zero/external/bazel_tools/third_party/ijar/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C++ Compiler'
	g++ -std=c++17 -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


