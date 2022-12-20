################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
S_UPPER_SRCS += \
../bazel-AutoML-Zero/external/zlib/contrib/amd64/amd64-match.S 

OBJS += \
./bazel-AutoML-Zero/external/zlib/contrib/amd64/amd64-match.o 


# Each subdirectory must supply rules for building sources it contributes
bazel-AutoML-Zero/external/zlib/contrib/amd64/%.o: ../bazel-AutoML-Zero/external/zlib/contrib/amd64/%.S bazel-AutoML-Zero/external/zlib/contrib/amd64/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: GCC Assembler'
	as  -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


