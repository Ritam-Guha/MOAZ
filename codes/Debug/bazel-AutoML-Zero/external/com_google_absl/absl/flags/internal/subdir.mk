################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../bazel-AutoML-Zero/external/com_google_absl/absl/flags/internal/commandlineflag.cc \
../bazel-AutoML-Zero/external/com_google_absl/absl/flags/internal/flag.cc \
../bazel-AutoML-Zero/external/com_google_absl/absl/flags/internal/path_util_test.cc \
../bazel-AutoML-Zero/external/com_google_absl/absl/flags/internal/private_handle_accessor.cc \
../bazel-AutoML-Zero/external/com_google_absl/absl/flags/internal/program_name.cc \
../bazel-AutoML-Zero/external/com_google_absl/absl/flags/internal/program_name_test.cc \
../bazel-AutoML-Zero/external/com_google_absl/absl/flags/internal/sequence_lock_test.cc \
../bazel-AutoML-Zero/external/com_google_absl/absl/flags/internal/usage.cc \
../bazel-AutoML-Zero/external/com_google_absl/absl/flags/internal/usage_test.cc 

CC_DEPS += \
./bazel-AutoML-Zero/external/com_google_absl/absl/flags/internal/commandlineflag.d \
./bazel-AutoML-Zero/external/com_google_absl/absl/flags/internal/flag.d \
./bazel-AutoML-Zero/external/com_google_absl/absl/flags/internal/path_util_test.d \
./bazel-AutoML-Zero/external/com_google_absl/absl/flags/internal/private_handle_accessor.d \
./bazel-AutoML-Zero/external/com_google_absl/absl/flags/internal/program_name.d \
./bazel-AutoML-Zero/external/com_google_absl/absl/flags/internal/program_name_test.d \
./bazel-AutoML-Zero/external/com_google_absl/absl/flags/internal/sequence_lock_test.d \
./bazel-AutoML-Zero/external/com_google_absl/absl/flags/internal/usage.d \
./bazel-AutoML-Zero/external/com_google_absl/absl/flags/internal/usage_test.d 

OBJS += \
./bazel-AutoML-Zero/external/com_google_absl/absl/flags/internal/commandlineflag.o \
./bazel-AutoML-Zero/external/com_google_absl/absl/flags/internal/flag.o \
./bazel-AutoML-Zero/external/com_google_absl/absl/flags/internal/path_util_test.o \
./bazel-AutoML-Zero/external/com_google_absl/absl/flags/internal/private_handle_accessor.o \
./bazel-AutoML-Zero/external/com_google_absl/absl/flags/internal/program_name.o \
./bazel-AutoML-Zero/external/com_google_absl/absl/flags/internal/program_name_test.o \
./bazel-AutoML-Zero/external/com_google_absl/absl/flags/internal/sequence_lock_test.o \
./bazel-AutoML-Zero/external/com_google_absl/absl/flags/internal/usage.o \
./bazel-AutoML-Zero/external/com_google_absl/absl/flags/internal/usage_test.o 


# Each subdirectory must supply rules for building sources it contributes
bazel-AutoML-Zero/external/com_google_absl/absl/flags/internal/%.o: ../bazel-AutoML-Zero/external/com_google_absl/absl/flags/internal/%.cc bazel-AutoML-Zero/external/com_google_absl/absl/flags/internal/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C++ Compiler'
	g++ -std=c++17 -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


