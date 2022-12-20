################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../bazel-AutoML-Zero/external/com_google_protobuf/src/google/protobuf/io/coded_stream.cc \
../bazel-AutoML-Zero/external/com_google_protobuf/src/google/protobuf/io/coded_stream_unittest.cc \
../bazel-AutoML-Zero/external/com_google_protobuf/src/google/protobuf/io/gzip_stream.cc \
../bazel-AutoML-Zero/external/com_google_protobuf/src/google/protobuf/io/io_win32.cc \
../bazel-AutoML-Zero/external/com_google_protobuf/src/google/protobuf/io/io_win32_unittest.cc \
../bazel-AutoML-Zero/external/com_google_protobuf/src/google/protobuf/io/printer.cc \
../bazel-AutoML-Zero/external/com_google_protobuf/src/google/protobuf/io/printer_unittest.cc \
../bazel-AutoML-Zero/external/com_google_protobuf/src/google/protobuf/io/strtod.cc \
../bazel-AutoML-Zero/external/com_google_protobuf/src/google/protobuf/io/tokenizer.cc \
../bazel-AutoML-Zero/external/com_google_protobuf/src/google/protobuf/io/tokenizer_unittest.cc \
../bazel-AutoML-Zero/external/com_google_protobuf/src/google/protobuf/io/zero_copy_stream.cc \
../bazel-AutoML-Zero/external/com_google_protobuf/src/google/protobuf/io/zero_copy_stream_impl.cc \
../bazel-AutoML-Zero/external/com_google_protobuf/src/google/protobuf/io/zero_copy_stream_impl_lite.cc \
../bazel-AutoML-Zero/external/com_google_protobuf/src/google/protobuf/io/zero_copy_stream_unittest.cc 

CC_DEPS += \
./bazel-AutoML-Zero/external/com_google_protobuf/src/google/protobuf/io/coded_stream.d \
./bazel-AutoML-Zero/external/com_google_protobuf/src/google/protobuf/io/coded_stream_unittest.d \
./bazel-AutoML-Zero/external/com_google_protobuf/src/google/protobuf/io/gzip_stream.d \
./bazel-AutoML-Zero/external/com_google_protobuf/src/google/protobuf/io/io_win32.d \
./bazel-AutoML-Zero/external/com_google_protobuf/src/google/protobuf/io/io_win32_unittest.d \
./bazel-AutoML-Zero/external/com_google_protobuf/src/google/protobuf/io/printer.d \
./bazel-AutoML-Zero/external/com_google_protobuf/src/google/protobuf/io/printer_unittest.d \
./bazel-AutoML-Zero/external/com_google_protobuf/src/google/protobuf/io/strtod.d \
./bazel-AutoML-Zero/external/com_google_protobuf/src/google/protobuf/io/tokenizer.d \
./bazel-AutoML-Zero/external/com_google_protobuf/src/google/protobuf/io/tokenizer_unittest.d \
./bazel-AutoML-Zero/external/com_google_protobuf/src/google/protobuf/io/zero_copy_stream.d \
./bazel-AutoML-Zero/external/com_google_protobuf/src/google/protobuf/io/zero_copy_stream_impl.d \
./bazel-AutoML-Zero/external/com_google_protobuf/src/google/protobuf/io/zero_copy_stream_impl_lite.d \
./bazel-AutoML-Zero/external/com_google_protobuf/src/google/protobuf/io/zero_copy_stream_unittest.d 

OBJS += \
./bazel-AutoML-Zero/external/com_google_protobuf/src/google/protobuf/io/coded_stream.o \
./bazel-AutoML-Zero/external/com_google_protobuf/src/google/protobuf/io/coded_stream_unittest.o \
./bazel-AutoML-Zero/external/com_google_protobuf/src/google/protobuf/io/gzip_stream.o \
./bazel-AutoML-Zero/external/com_google_protobuf/src/google/protobuf/io/io_win32.o \
./bazel-AutoML-Zero/external/com_google_protobuf/src/google/protobuf/io/io_win32_unittest.o \
./bazel-AutoML-Zero/external/com_google_protobuf/src/google/protobuf/io/printer.o \
./bazel-AutoML-Zero/external/com_google_protobuf/src/google/protobuf/io/printer_unittest.o \
./bazel-AutoML-Zero/external/com_google_protobuf/src/google/protobuf/io/strtod.o \
./bazel-AutoML-Zero/external/com_google_protobuf/src/google/protobuf/io/tokenizer.o \
./bazel-AutoML-Zero/external/com_google_protobuf/src/google/protobuf/io/tokenizer_unittest.o \
./bazel-AutoML-Zero/external/com_google_protobuf/src/google/protobuf/io/zero_copy_stream.o \
./bazel-AutoML-Zero/external/com_google_protobuf/src/google/protobuf/io/zero_copy_stream_impl.o \
./bazel-AutoML-Zero/external/com_google_protobuf/src/google/protobuf/io/zero_copy_stream_impl_lite.o \
./bazel-AutoML-Zero/external/com_google_protobuf/src/google/protobuf/io/zero_copy_stream_unittest.o 


# Each subdirectory must supply rules for building sources it contributes
bazel-AutoML-Zero/external/com_google_protobuf/src/google/protobuf/io/%.o: ../bazel-AutoML-Zero/external/com_google_protobuf/src/google/protobuf/io/%.cc bazel-AutoML-Zero/external/com_google_protobuf/src/google/protobuf/io/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C++ Compiler'
	g++ -std=c++17 -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


