################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
ASM_SRCS += \
../bazel-AutoML-Zero/external/zlib/contrib/masmx86/inffas32.asm \
../bazel-AutoML-Zero/external/zlib/contrib/masmx86/match686.asm 

OBJS += \
./bazel-AutoML-Zero/external/zlib/contrib/masmx86/inffas32.o \
./bazel-AutoML-Zero/external/zlib/contrib/masmx86/match686.o 


# Each subdirectory must supply rules for building sources it contributes
bazel-AutoML-Zero/external/zlib/contrib/masmx86/%.o: ../bazel-AutoML-Zero/external/zlib/contrib/masmx86/%.asm bazel-AutoML-Zero/external/zlib/contrib/masmx86/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: GCC Assembler'
	as  -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


