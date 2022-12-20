################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../bazel-AutoML-Zero/external/zlib/contrib/minizip/ioapi.c \
../bazel-AutoML-Zero/external/zlib/contrib/minizip/iowin32.c \
../bazel-AutoML-Zero/external/zlib/contrib/minizip/miniunz.c \
../bazel-AutoML-Zero/external/zlib/contrib/minizip/minizip.c \
../bazel-AutoML-Zero/external/zlib/contrib/minizip/mztools.c \
../bazel-AutoML-Zero/external/zlib/contrib/minizip/unzip.c \
../bazel-AutoML-Zero/external/zlib/contrib/minizip/zip.c 

OBJS += \
./bazel-AutoML-Zero/external/zlib/contrib/minizip/ioapi.o \
./bazel-AutoML-Zero/external/zlib/contrib/minizip/iowin32.o \
./bazel-AutoML-Zero/external/zlib/contrib/minizip/miniunz.o \
./bazel-AutoML-Zero/external/zlib/contrib/minizip/minizip.o \
./bazel-AutoML-Zero/external/zlib/contrib/minizip/mztools.o \
./bazel-AutoML-Zero/external/zlib/contrib/minizip/unzip.o \
./bazel-AutoML-Zero/external/zlib/contrib/minizip/zip.o 

C_DEPS += \
./bazel-AutoML-Zero/external/zlib/contrib/minizip/ioapi.d \
./bazel-AutoML-Zero/external/zlib/contrib/minizip/iowin32.d \
./bazel-AutoML-Zero/external/zlib/contrib/minizip/miniunz.d \
./bazel-AutoML-Zero/external/zlib/contrib/minizip/minizip.d \
./bazel-AutoML-Zero/external/zlib/contrib/minizip/mztools.d \
./bazel-AutoML-Zero/external/zlib/contrib/minizip/unzip.d \
./bazel-AutoML-Zero/external/zlib/contrib/minizip/zip.d 


# Each subdirectory must supply rules for building sources it contributes
bazel-AutoML-Zero/external/zlib/contrib/minizip/%.o: ../bazel-AutoML-Zero/external/zlib/contrib/minizip/%.c bazel-AutoML-Zero/external/zlib/contrib/minizip/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C Compiler'
	gcc -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


