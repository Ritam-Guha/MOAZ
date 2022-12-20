################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../bazel-AutoML-Zero/external/zlib/adler32.c \
../bazel-AutoML-Zero/external/zlib/compress.c \
../bazel-AutoML-Zero/external/zlib/crc32.c \
../bazel-AutoML-Zero/external/zlib/deflate.c \
../bazel-AutoML-Zero/external/zlib/gzclose.c \
../bazel-AutoML-Zero/external/zlib/gzlib.c \
../bazel-AutoML-Zero/external/zlib/gzread.c \
../bazel-AutoML-Zero/external/zlib/gzwrite.c \
../bazel-AutoML-Zero/external/zlib/infback.c \
../bazel-AutoML-Zero/external/zlib/inffast.c \
../bazel-AutoML-Zero/external/zlib/inflate.c \
../bazel-AutoML-Zero/external/zlib/inftrees.c \
../bazel-AutoML-Zero/external/zlib/trees.c \
../bazel-AutoML-Zero/external/zlib/uncompr.c \
../bazel-AutoML-Zero/external/zlib/zutil.c 

OBJS += \
./bazel-AutoML-Zero/external/zlib/adler32.o \
./bazel-AutoML-Zero/external/zlib/compress.o \
./bazel-AutoML-Zero/external/zlib/crc32.o \
./bazel-AutoML-Zero/external/zlib/deflate.o \
./bazel-AutoML-Zero/external/zlib/gzclose.o \
./bazel-AutoML-Zero/external/zlib/gzlib.o \
./bazel-AutoML-Zero/external/zlib/gzread.o \
./bazel-AutoML-Zero/external/zlib/gzwrite.o \
./bazel-AutoML-Zero/external/zlib/infback.o \
./bazel-AutoML-Zero/external/zlib/inffast.o \
./bazel-AutoML-Zero/external/zlib/inflate.o \
./bazel-AutoML-Zero/external/zlib/inftrees.o \
./bazel-AutoML-Zero/external/zlib/trees.o \
./bazel-AutoML-Zero/external/zlib/uncompr.o \
./bazel-AutoML-Zero/external/zlib/zutil.o 

C_DEPS += \
./bazel-AutoML-Zero/external/zlib/adler32.d \
./bazel-AutoML-Zero/external/zlib/compress.d \
./bazel-AutoML-Zero/external/zlib/crc32.d \
./bazel-AutoML-Zero/external/zlib/deflate.d \
./bazel-AutoML-Zero/external/zlib/gzclose.d \
./bazel-AutoML-Zero/external/zlib/gzlib.d \
./bazel-AutoML-Zero/external/zlib/gzread.d \
./bazel-AutoML-Zero/external/zlib/gzwrite.d \
./bazel-AutoML-Zero/external/zlib/infback.d \
./bazel-AutoML-Zero/external/zlib/inffast.d \
./bazel-AutoML-Zero/external/zlib/inflate.d \
./bazel-AutoML-Zero/external/zlib/inftrees.d \
./bazel-AutoML-Zero/external/zlib/trees.d \
./bazel-AutoML-Zero/external/zlib/uncompr.d \
./bazel-AutoML-Zero/external/zlib/zutil.d 


# Each subdirectory must supply rules for building sources it contributes
bazel-AutoML-Zero/external/zlib/%.o: ../bazel-AutoML-Zero/external/zlib/%.c bazel-AutoML-Zero/external/zlib/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C Compiler'
	gcc -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


