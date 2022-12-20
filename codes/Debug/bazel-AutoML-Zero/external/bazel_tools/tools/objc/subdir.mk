################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../bazel-AutoML-Zero/external/bazel_tools/tools/objc/dummy.c 

OBJS += \
./bazel-AutoML-Zero/external/bazel_tools/tools/objc/dummy.o 

C_DEPS += \
./bazel-AutoML-Zero/external/bazel_tools/tools/objc/dummy.d 


# Each subdirectory must supply rules for building sources it contributes
bazel-AutoML-Zero/external/bazel_tools/tools/objc/%.o: ../bazel-AutoML-Zero/external/bazel_tools/tools/objc/%.c bazel-AutoML-Zero/external/bazel_tools/tools/objc/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C Compiler'
	gcc -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


