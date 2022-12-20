################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../bazel-AutoML-Zero/external/zlib/examples/enough.c \
../bazel-AutoML-Zero/external/zlib/examples/fitblk.c \
../bazel-AutoML-Zero/external/zlib/examples/gun.c \
../bazel-AutoML-Zero/external/zlib/examples/gzappend.c \
../bazel-AutoML-Zero/external/zlib/examples/gzjoin.c \
../bazel-AutoML-Zero/external/zlib/examples/gzlog.c \
../bazel-AutoML-Zero/external/zlib/examples/zpipe.c \
../bazel-AutoML-Zero/external/zlib/examples/zran.c 

OBJS += \
./bazel-AutoML-Zero/external/zlib/examples/enough.o \
./bazel-AutoML-Zero/external/zlib/examples/fitblk.o \
./bazel-AutoML-Zero/external/zlib/examples/gun.o \
./bazel-AutoML-Zero/external/zlib/examples/gzappend.o \
./bazel-AutoML-Zero/external/zlib/examples/gzjoin.o \
./bazel-AutoML-Zero/external/zlib/examples/gzlog.o \
./bazel-AutoML-Zero/external/zlib/examples/zpipe.o \
./bazel-AutoML-Zero/external/zlib/examples/zran.o 

C_DEPS += \
./bazel-AutoML-Zero/external/zlib/examples/enough.d \
./bazel-AutoML-Zero/external/zlib/examples/fitblk.d \
./bazel-AutoML-Zero/external/zlib/examples/gun.d \
./bazel-AutoML-Zero/external/zlib/examples/gzappend.d \
./bazel-AutoML-Zero/external/zlib/examples/gzjoin.d \
./bazel-AutoML-Zero/external/zlib/examples/gzlog.d \
./bazel-AutoML-Zero/external/zlib/examples/zpipe.d \
./bazel-AutoML-Zero/external/zlib/examples/zran.d 


# Each subdirectory must supply rules for building sources it contributes
bazel-AutoML-Zero/external/zlib/examples/%.o: ../bazel-AutoML-Zero/external/zlib/examples/%.c bazel-AutoML-Zero/external/zlib/examples/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C Compiler'
	gcc -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


