################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
ASM_SRCS += \
../bazel-AutoML-Zero/external/zlib/contrib/masmx64/gvmat64.asm \
../bazel-AutoML-Zero/external/zlib/contrib/masmx64/inffasx64.asm 

C_SRCS += \
../bazel-AutoML-Zero/external/zlib/contrib/masmx64/inffas8664.c 

OBJS += \
./bazel-AutoML-Zero/external/zlib/contrib/masmx64/gvmat64.o \
./bazel-AutoML-Zero/external/zlib/contrib/masmx64/inffas8664.o \
./bazel-AutoML-Zero/external/zlib/contrib/masmx64/inffasx64.o 

C_DEPS += \
./bazel-AutoML-Zero/external/zlib/contrib/masmx64/inffas8664.d 


# Each subdirectory must supply rules for building sources it contributes
bazel-AutoML-Zero/external/zlib/contrib/masmx64/%.o: ../bazel-AutoML-Zero/external/zlib/contrib/masmx64/%.asm bazel-AutoML-Zero/external/zlib/contrib/masmx64/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: GCC Assembler'
	as  -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

bazel-AutoML-Zero/external/zlib/contrib/masmx64/%.o: ../bazel-AutoML-Zero/external/zlib/contrib/masmx64/%.c bazel-AutoML-Zero/external/zlib/contrib/masmx64/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C Compiler'
	gcc -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


