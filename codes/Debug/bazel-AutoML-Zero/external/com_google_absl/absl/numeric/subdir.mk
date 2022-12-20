################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../bazel-AutoML-Zero/external/com_google_absl/absl/numeric/bits_test.cc \
../bazel-AutoML-Zero/external/com_google_absl/absl/numeric/int128.cc \
../bazel-AutoML-Zero/external/com_google_absl/absl/numeric/int128_benchmark.cc \
../bazel-AutoML-Zero/external/com_google_absl/absl/numeric/int128_stream_test.cc \
../bazel-AutoML-Zero/external/com_google_absl/absl/numeric/int128_test.cc 

CC_DEPS += \
./bazel-AutoML-Zero/external/com_google_absl/absl/numeric/bits_test.d \
./bazel-AutoML-Zero/external/com_google_absl/absl/numeric/int128.d \
./bazel-AutoML-Zero/external/com_google_absl/absl/numeric/int128_benchmark.d \
./bazel-AutoML-Zero/external/com_google_absl/absl/numeric/int128_stream_test.d \
./bazel-AutoML-Zero/external/com_google_absl/absl/numeric/int128_test.d 

OBJS += \
./bazel-AutoML-Zero/external/com_google_absl/absl/numeric/bits_test.o \
./bazel-AutoML-Zero/external/com_google_absl/absl/numeric/int128.o \
./bazel-AutoML-Zero/external/com_google_absl/absl/numeric/int128_benchmark.o \
./bazel-AutoML-Zero/external/com_google_absl/absl/numeric/int128_stream_test.o \
./bazel-AutoML-Zero/external/com_google_absl/absl/numeric/int128_test.o 


# Each subdirectory must supply rules for building sources it contributes
bazel-AutoML-Zero/external/com_google_absl/absl/numeric/%.o: ../bazel-AutoML-Zero/external/com_google_absl/absl/numeric/%.cc bazel-AutoML-Zero/external/com_google_absl/absl/numeric/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C++ Compiler'
	g++ -std=c++17 -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


