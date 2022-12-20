################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../bazel-AutoML-Zero/external/bazel_tools/third_party/zlib/adler32.c \
../bazel-AutoML-Zero/external/bazel_tools/third_party/zlib/compress.c \
../bazel-AutoML-Zero/external/bazel_tools/third_party/zlib/crc32.c \
../bazel-AutoML-Zero/external/bazel_tools/third_party/zlib/deflate.c \
../bazel-AutoML-Zero/external/bazel_tools/third_party/zlib/gzclose.c \
../bazel-AutoML-Zero/external/bazel_tools/third_party/zlib/gzlib.c \
../bazel-AutoML-Zero/external/bazel_tools/third_party/zlib/gzread.c \
../bazel-AutoML-Zero/external/bazel_tools/third_party/zlib/gzwrite.c \
../bazel-AutoML-Zero/external/bazel_tools/third_party/zlib/infback.c \
../bazel-AutoML-Zero/external/bazel_tools/third_party/zlib/inffast.c \
../bazel-AutoML-Zero/external/bazel_tools/third_party/zlib/inflate.c \
../bazel-AutoML-Zero/external/bazel_tools/third_party/zlib/inftrees.c \
../bazel-AutoML-Zero/external/bazel_tools/third_party/zlib/trees.c \
../bazel-AutoML-Zero/external/bazel_tools/third_party/zlib/uncompr.c \
../bazel-AutoML-Zero/external/bazel_tools/third_party/zlib/zutil.c 

OBJS += \
./bazel-AutoML-Zero/external/bazel_tools/third_party/zlib/adler32.o \
./bazel-AutoML-Zero/external/bazel_tools/third_party/zlib/compress.o \
./bazel-AutoML-Zero/external/bazel_tools/third_party/zlib/crc32.o \
./bazel-AutoML-Zero/external/bazel_tools/third_party/zlib/deflate.o \
./bazel-AutoML-Zero/external/bazel_tools/third_party/zlib/gzclose.o \
./bazel-AutoML-Zero/external/bazel_tools/third_party/zlib/gzlib.o \
./bazel-AutoML-Zero/external/bazel_tools/third_party/zlib/gzread.o \
./bazel-AutoML-Zero/external/bazel_tools/third_party/zlib/gzwrite.o \
./bazel-AutoML-Zero/external/bazel_tools/third_party/zlib/infback.o \
./bazel-AutoML-Zero/external/bazel_tools/third_party/zlib/inffast.o \
./bazel-AutoML-Zero/external/bazel_tools/third_party/zlib/inflate.o \
./bazel-AutoML-Zero/external/bazel_tools/third_party/zlib/inftrees.o \
./bazel-AutoML-Zero/external/bazel_tools/third_party/zlib/trees.o \
./bazel-AutoML-Zero/external/bazel_tools/third_party/zlib/uncompr.o \
./bazel-AutoML-Zero/external/bazel_tools/third_party/zlib/zutil.o 

C_DEPS += \
./bazel-AutoML-Zero/external/bazel_tools/third_party/zlib/adler32.d \
./bazel-AutoML-Zero/external/bazel_tools/third_party/zlib/compress.d \
./bazel-AutoML-Zero/external/bazel_tools/third_party/zlib/crc32.d \
./bazel-AutoML-Zero/external/bazel_tools/third_party/zlib/deflate.d \
./bazel-AutoML-Zero/external/bazel_tools/third_party/zlib/gzclose.d \
./bazel-AutoML-Zero/external/bazel_tools/third_party/zlib/gzlib.d \
./bazel-AutoML-Zero/external/bazel_tools/third_party/zlib/gzread.d \
./bazel-AutoML-Zero/external/bazel_tools/third_party/zlib/gzwrite.d \
./bazel-AutoML-Zero/external/bazel_tools/third_party/zlib/infback.d \
./bazel-AutoML-Zero/external/bazel_tools/third_party/zlib/inffast.d \
./bazel-AutoML-Zero/external/bazel_tools/third_party/zlib/inflate.d \
./bazel-AutoML-Zero/external/bazel_tools/third_party/zlib/inftrees.d \
./bazel-AutoML-Zero/external/bazel_tools/third_party/zlib/trees.d \
./bazel-AutoML-Zero/external/bazel_tools/third_party/zlib/uncompr.d \
./bazel-AutoML-Zero/external/bazel_tools/third_party/zlib/zutil.d 


# Each subdirectory must supply rules for building sources it contributes
bazel-AutoML-Zero/external/bazel_tools/third_party/zlib/%.o: ../bazel-AutoML-Zero/external/bazel_tools/third_party/zlib/%.c bazel-AutoML-Zero/external/bazel_tools/third_party/zlib/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C Compiler'
	gcc -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


