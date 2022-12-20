################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../bazel-AutoML-Zero/external/com_github_gflags_gflags/test/gflags_declare_flags.cc \
../bazel-AutoML-Zero/external/com_github_gflags_gflags/test/gflags_declare_test.cc \
../bazel-AutoML-Zero/external/com_github_gflags_gflags/test/gflags_strip_flags_test.cc \
../bazel-AutoML-Zero/external/com_github_gflags_gflags/test/gflags_unittest.cc 

CC_DEPS += \
./bazel-AutoML-Zero/external/com_github_gflags_gflags/test/gflags_declare_flags.d \
./bazel-AutoML-Zero/external/com_github_gflags_gflags/test/gflags_declare_test.d \
./bazel-AutoML-Zero/external/com_github_gflags_gflags/test/gflags_strip_flags_test.d \
./bazel-AutoML-Zero/external/com_github_gflags_gflags/test/gflags_unittest.d 

OBJS += \
./bazel-AutoML-Zero/external/com_github_gflags_gflags/test/gflags_declare_flags.o \
./bazel-AutoML-Zero/external/com_github_gflags_gflags/test/gflags_declare_test.o \
./bazel-AutoML-Zero/external/com_github_gflags_gflags/test/gflags_strip_flags_test.o \
./bazel-AutoML-Zero/external/com_github_gflags_gflags/test/gflags_unittest.o 


# Each subdirectory must supply rules for building sources it contributes
bazel-AutoML-Zero/external/com_github_gflags_gflags/test/%.o: ../bazel-AutoML-Zero/external/com_github_gflags_gflags/test/%.cc bazel-AutoML-Zero/external/com_github_gflags_gflags/test/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C++ Compiler'
	g++ -std=c++17 -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


