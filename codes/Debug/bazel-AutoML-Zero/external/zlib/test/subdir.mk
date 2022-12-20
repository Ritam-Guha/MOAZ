################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../bazel-AutoML-Zero/external/zlib/test/example.c \
../bazel-AutoML-Zero/external/zlib/test/infcover.c \
../bazel-AutoML-Zero/external/zlib/test/minigzip.c 

OBJS += \
./bazel-AutoML-Zero/external/zlib/test/example.o \
./bazel-AutoML-Zero/external/zlib/test/infcover.o \
./bazel-AutoML-Zero/external/zlib/test/minigzip.o 

C_DEPS += \
./bazel-AutoML-Zero/external/zlib/test/example.d \
./bazel-AutoML-Zero/external/zlib/test/infcover.d \
./bazel-AutoML-Zero/external/zlib/test/minigzip.d 


# Each subdirectory must supply rules for building sources it contributes
bazel-AutoML-Zero/external/zlib/test/%.o: ../bazel-AutoML-Zero/external/zlib/test/%.c bazel-AutoML-Zero/external/zlib/test/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C Compiler'
	gcc -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


