################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../bazel-AutoML-Zero/external/com_google_glog/bazel/example/main.cc 

CC_DEPS += \
./bazel-AutoML-Zero/external/com_google_glog/bazel/example/main.d 

OBJS += \
./bazel-AutoML-Zero/external/com_google_glog/bazel/example/main.o 


# Each subdirectory must supply rules for building sources it contributes
bazel-AutoML-Zero/external/com_google_glog/bazel/example/%.o: ../bazel-AutoML-Zero/external/com_google_glog/bazel/example/%.cc bazel-AutoML-Zero/external/com_google_glog/bazel/example/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C++ Compiler'
	g++ -std=c++17 -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


