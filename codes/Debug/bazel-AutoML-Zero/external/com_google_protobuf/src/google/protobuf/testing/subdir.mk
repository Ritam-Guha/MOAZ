################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../bazel-AutoML-Zero/external/com_google_protobuf/src/google/protobuf/testing/file.cc \
../bazel-AutoML-Zero/external/com_google_protobuf/src/google/protobuf/testing/googletest.cc \
../bazel-AutoML-Zero/external/com_google_protobuf/src/google/protobuf/testing/zcgunzip.cc \
../bazel-AutoML-Zero/external/com_google_protobuf/src/google/protobuf/testing/zcgzip.cc 

CC_DEPS += \
./bazel-AutoML-Zero/external/com_google_protobuf/src/google/protobuf/testing/file.d \
./bazel-AutoML-Zero/external/com_google_protobuf/src/google/protobuf/testing/googletest.d \
./bazel-AutoML-Zero/external/com_google_protobuf/src/google/protobuf/testing/zcgunzip.d \
./bazel-AutoML-Zero/external/com_google_protobuf/src/google/protobuf/testing/zcgzip.d 

OBJS += \
./bazel-AutoML-Zero/external/com_google_protobuf/src/google/protobuf/testing/file.o \
./bazel-AutoML-Zero/external/com_google_protobuf/src/google/protobuf/testing/googletest.o \
./bazel-AutoML-Zero/external/com_google_protobuf/src/google/protobuf/testing/zcgunzip.o \
./bazel-AutoML-Zero/external/com_google_protobuf/src/google/protobuf/testing/zcgzip.o 


# Each subdirectory must supply rules for building sources it contributes
bazel-AutoML-Zero/external/com_google_protobuf/src/google/protobuf/testing/%.o: ../bazel-AutoML-Zero/external/com_google_protobuf/src/google/protobuf/testing/%.cc bazel-AutoML-Zero/external/com_google_protobuf/src/google/protobuf/testing/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C++ Compiler'
	g++ -std=c++17 -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


