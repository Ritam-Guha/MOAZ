################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../bazel-AutoML-Zero/external/com_github_gflags_gflags/src/gflags.cc \
../bazel-AutoML-Zero/external/com_github_gflags_gflags/src/gflags_completions.cc \
../bazel-AutoML-Zero/external/com_github_gflags_gflags/src/gflags_reporting.cc \
../bazel-AutoML-Zero/external/com_github_gflags_gflags/src/windows_port.cc 

CC_DEPS += \
./bazel-AutoML-Zero/external/com_github_gflags_gflags/src/gflags.d \
./bazel-AutoML-Zero/external/com_github_gflags_gflags/src/gflags_completions.d \
./bazel-AutoML-Zero/external/com_github_gflags_gflags/src/gflags_reporting.d \
./bazel-AutoML-Zero/external/com_github_gflags_gflags/src/windows_port.d 

OBJS += \
./bazel-AutoML-Zero/external/com_github_gflags_gflags/src/gflags.o \
./bazel-AutoML-Zero/external/com_github_gflags_gflags/src/gflags_completions.o \
./bazel-AutoML-Zero/external/com_github_gflags_gflags/src/gflags_reporting.o \
./bazel-AutoML-Zero/external/com_github_gflags_gflags/src/windows_port.o 


# Each subdirectory must supply rules for building sources it contributes
bazel-AutoML-Zero/external/com_github_gflags_gflags/src/%.o: ../bazel-AutoML-Zero/external/com_github_gflags_gflags/src/%.cc bazel-AutoML-Zero/external/com_github_gflags_gflags/src/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C++ Compiler'
	g++ -std=c++17 -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


