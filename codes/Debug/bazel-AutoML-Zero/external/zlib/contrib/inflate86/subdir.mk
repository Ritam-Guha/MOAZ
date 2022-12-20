################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../bazel-AutoML-Zero/external/zlib/contrib/inflate86/inffas86.c 

S_UPPER_SRCS += \
../bazel-AutoML-Zero/external/zlib/contrib/inflate86/inffast.S 

OBJS += \
./bazel-AutoML-Zero/external/zlib/contrib/inflate86/inffas86.o \
./bazel-AutoML-Zero/external/zlib/contrib/inflate86/inffast.o 

C_DEPS += \
./bazel-AutoML-Zero/external/zlib/contrib/inflate86/inffas86.d 


# Each subdirectory must supply rules for building sources it contributes
bazel-AutoML-Zero/external/zlib/contrib/inflate86/%.o: ../bazel-AutoML-Zero/external/zlib/contrib/inflate86/%.c bazel-AutoML-Zero/external/zlib/contrib/inflate86/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C Compiler'
	gcc -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

bazel-AutoML-Zero/external/zlib/contrib/inflate86/%.o: ../bazel-AutoML-Zero/external/zlib/contrib/inflate86/%.S bazel-AutoML-Zero/external/zlib/contrib/inflate86/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: GCC Assembler'
	as  -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


