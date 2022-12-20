################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../bazel-AutoML-Zero/external/com_github_gflags_gflags/test/nc/gflags_nc.cc 

CC_DEPS += \
./bazel-AutoML-Zero/external/com_github_gflags_gflags/test/nc/gflags_nc.d 

OBJS += \
./bazel-AutoML-Zero/external/com_github_gflags_gflags/test/nc/gflags_nc.o 


# Each subdirectory must supply rules for building sources it contributes
bazel-AutoML-Zero/external/com_github_gflags_gflags/test/nc/%.o: ../bazel-AutoML-Zero/external/com_github_gflags_gflags/test/nc/%.cc bazel-AutoML-Zero/external/com_github_gflags_gflags/test/nc/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C++ Compiler'
	g++ -std=c++17 -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


