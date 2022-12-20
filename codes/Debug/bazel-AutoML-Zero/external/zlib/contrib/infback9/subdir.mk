################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../bazel-AutoML-Zero/external/zlib/contrib/infback9/infback9.c \
../bazel-AutoML-Zero/external/zlib/contrib/infback9/inftree9.c 

OBJS += \
./bazel-AutoML-Zero/external/zlib/contrib/infback9/infback9.o \
./bazel-AutoML-Zero/external/zlib/contrib/infback9/inftree9.o 

C_DEPS += \
./bazel-AutoML-Zero/external/zlib/contrib/infback9/infback9.d \
./bazel-AutoML-Zero/external/zlib/contrib/infback9/inftree9.d 


# Each subdirectory must supply rules for building sources it contributes
bazel-AutoML-Zero/external/zlib/contrib/infback9/%.o: ../bazel-AutoML-Zero/external/zlib/contrib/infback9/%.c bazel-AutoML-Zero/external/zlib/contrib/infback9/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C Compiler'
	gcc -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


