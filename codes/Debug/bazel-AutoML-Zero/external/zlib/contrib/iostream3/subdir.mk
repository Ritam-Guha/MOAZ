################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../bazel-AutoML-Zero/external/zlib/contrib/iostream3/test.cc \
../bazel-AutoML-Zero/external/zlib/contrib/iostream3/zfstream.cc 

CC_DEPS += \
./bazel-AutoML-Zero/external/zlib/contrib/iostream3/test.d \
./bazel-AutoML-Zero/external/zlib/contrib/iostream3/zfstream.d 

OBJS += \
./bazel-AutoML-Zero/external/zlib/contrib/iostream3/test.o \
./bazel-AutoML-Zero/external/zlib/contrib/iostream3/zfstream.o 


# Each subdirectory must supply rules for building sources it contributes
bazel-AutoML-Zero/external/zlib/contrib/iostream3/%.o: ../bazel-AutoML-Zero/external/zlib/contrib/iostream3/%.cc bazel-AutoML-Zero/external/zlib/contrib/iostream3/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C++ Compiler'
	g++ -std=c++17 -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


