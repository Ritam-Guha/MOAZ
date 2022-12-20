################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../bazel-AutoML-Zero/external/com_google_protobuf/python/google/protobuf/internal/api_implementation.cc \
../bazel-AutoML-Zero/external/com_google_protobuf/python/google/protobuf/internal/python_protobuf.cc 

CC_DEPS += \
./bazel-AutoML-Zero/external/com_google_protobuf/python/google/protobuf/internal/api_implementation.d \
./bazel-AutoML-Zero/external/com_google_protobuf/python/google/protobuf/internal/python_protobuf.d 

OBJS += \
./bazel-AutoML-Zero/external/com_google_protobuf/python/google/protobuf/internal/api_implementation.o \
./bazel-AutoML-Zero/external/com_google_protobuf/python/google/protobuf/internal/python_protobuf.o 


# Each subdirectory must supply rules for building sources it contributes
bazel-AutoML-Zero/external/com_google_protobuf/python/google/protobuf/internal/%.o: ../bazel-AutoML-Zero/external/com_google_protobuf/python/google/protobuf/internal/%.cc bazel-AutoML-Zero/external/com_google_protobuf/python/google/protobuf/internal/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C++ Compiler'
	g++ -std=c++17 -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


