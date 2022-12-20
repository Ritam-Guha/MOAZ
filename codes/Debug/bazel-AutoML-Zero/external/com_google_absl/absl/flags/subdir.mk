################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../bazel-AutoML-Zero/external/com_google_absl/absl/flags/commandlineflag.cc \
../bazel-AutoML-Zero/external/com_google_absl/absl/flags/commandlineflag_test.cc \
../bazel-AutoML-Zero/external/com_google_absl/absl/flags/config_test.cc \
../bazel-AutoML-Zero/external/com_google_absl/absl/flags/flag.cc \
../bazel-AutoML-Zero/external/com_google_absl/absl/flags/flag_benchmark.cc \
../bazel-AutoML-Zero/external/com_google_absl/absl/flags/flag_test.cc \
../bazel-AutoML-Zero/external/com_google_absl/absl/flags/flag_test_defs.cc \
../bazel-AutoML-Zero/external/com_google_absl/absl/flags/marshalling.cc \
../bazel-AutoML-Zero/external/com_google_absl/absl/flags/marshalling_test.cc \
../bazel-AutoML-Zero/external/com_google_absl/absl/flags/parse.cc \
../bazel-AutoML-Zero/external/com_google_absl/absl/flags/parse_test.cc \
../bazel-AutoML-Zero/external/com_google_absl/absl/flags/reflection.cc \
../bazel-AutoML-Zero/external/com_google_absl/absl/flags/reflection_test.cc \
../bazel-AutoML-Zero/external/com_google_absl/absl/flags/usage.cc \
../bazel-AutoML-Zero/external/com_google_absl/absl/flags/usage_config.cc \
../bazel-AutoML-Zero/external/com_google_absl/absl/flags/usage_config_test.cc 

CC_DEPS += \
./bazel-AutoML-Zero/external/com_google_absl/absl/flags/commandlineflag.d \
./bazel-AutoML-Zero/external/com_google_absl/absl/flags/commandlineflag_test.d \
./bazel-AutoML-Zero/external/com_google_absl/absl/flags/config_test.d \
./bazel-AutoML-Zero/external/com_google_absl/absl/flags/flag.d \
./bazel-AutoML-Zero/external/com_google_absl/absl/flags/flag_benchmark.d \
./bazel-AutoML-Zero/external/com_google_absl/absl/flags/flag_test.d \
./bazel-AutoML-Zero/external/com_google_absl/absl/flags/flag_test_defs.d \
./bazel-AutoML-Zero/external/com_google_absl/absl/flags/marshalling.d \
./bazel-AutoML-Zero/external/com_google_absl/absl/flags/marshalling_test.d \
./bazel-AutoML-Zero/external/com_google_absl/absl/flags/parse.d \
./bazel-AutoML-Zero/external/com_google_absl/absl/flags/parse_test.d \
./bazel-AutoML-Zero/external/com_google_absl/absl/flags/reflection.d \
./bazel-AutoML-Zero/external/com_google_absl/absl/flags/reflection_test.d \
./bazel-AutoML-Zero/external/com_google_absl/absl/flags/usage.d \
./bazel-AutoML-Zero/external/com_google_absl/absl/flags/usage_config.d \
./bazel-AutoML-Zero/external/com_google_absl/absl/flags/usage_config_test.d 

OBJS += \
./bazel-AutoML-Zero/external/com_google_absl/absl/flags/commandlineflag.o \
./bazel-AutoML-Zero/external/com_google_absl/absl/flags/commandlineflag_test.o \
./bazel-AutoML-Zero/external/com_google_absl/absl/flags/config_test.o \
./bazel-AutoML-Zero/external/com_google_absl/absl/flags/flag.o \
./bazel-AutoML-Zero/external/com_google_absl/absl/flags/flag_benchmark.o \
./bazel-AutoML-Zero/external/com_google_absl/absl/flags/flag_test.o \
./bazel-AutoML-Zero/external/com_google_absl/absl/flags/flag_test_defs.o \
./bazel-AutoML-Zero/external/com_google_absl/absl/flags/marshalling.o \
./bazel-AutoML-Zero/external/com_google_absl/absl/flags/marshalling_test.o \
./bazel-AutoML-Zero/external/com_google_absl/absl/flags/parse.o \
./bazel-AutoML-Zero/external/com_google_absl/absl/flags/parse_test.o \
./bazel-AutoML-Zero/external/com_google_absl/absl/flags/reflection.o \
./bazel-AutoML-Zero/external/com_google_absl/absl/flags/reflection_test.o \
./bazel-AutoML-Zero/external/com_google_absl/absl/flags/usage.o \
./bazel-AutoML-Zero/external/com_google_absl/absl/flags/usage_config.o \
./bazel-AutoML-Zero/external/com_google_absl/absl/flags/usage_config_test.o 


# Each subdirectory must supply rules for building sources it contributes
bazel-AutoML-Zero/external/com_google_absl/absl/flags/%.o: ../bazel-AutoML-Zero/external/com_google_absl/absl/flags/%.cc bazel-AutoML-Zero/external/com_google_absl/absl/flags/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C++ Compiler'
	g++ -std=c++17 -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


