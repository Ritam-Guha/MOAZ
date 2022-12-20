################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../bazel-AutoML-Zero/external/com_github_gflags_gflags/test/config/main.cc 

CC_DEPS += \
./bazel-AutoML-Zero/external/com_github_gflags_gflags/test/config/main.d 

OBJS += \
./bazel-AutoML-Zero/external/com_github_gflags_gflags/test/config/main.o 


# Each subdirectory must supply rules for building sources it contributes
bazel-AutoML-Zero/external/com_github_gflags_gflags/test/config/%.o: ../bazel-AutoML-Zero/external/com_github_gflags_gflags/test/config/%.cc bazel-AutoML-Zero/external/com_github_gflags_gflags/test/config/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C++ Compiler'
	g++ -std=c++17 -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


