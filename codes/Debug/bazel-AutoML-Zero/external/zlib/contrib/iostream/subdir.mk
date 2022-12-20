################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CPP_SRCS += \
../bazel-AutoML-Zero/external/zlib/contrib/iostream/test.cpp \
../bazel-AutoML-Zero/external/zlib/contrib/iostream/zfstream.cpp 

OBJS += \
./bazel-AutoML-Zero/external/zlib/contrib/iostream/test.o \
./bazel-AutoML-Zero/external/zlib/contrib/iostream/zfstream.o 

CPP_DEPS += \
./bazel-AutoML-Zero/external/zlib/contrib/iostream/test.d \
./bazel-AutoML-Zero/external/zlib/contrib/iostream/zfstream.d 


# Each subdirectory must supply rules for building sources it contributes
bazel-AutoML-Zero/external/zlib/contrib/iostream/%.o: ../bazel-AutoML-Zero/external/zlib/contrib/iostream/%.cpp bazel-AutoML-Zero/external/zlib/contrib/iostream/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C++ Compiler'
	g++ -std=c++17 -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


