################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../bazel-AutoML-Zero/external/com_google_protobuf/benchmarks/util/gogo_data_scrubber.cc \
../bazel-AutoML-Zero/external/com_google_protobuf/benchmarks/util/proto3_data_stripper.cc \
../bazel-AutoML-Zero/external/com_google_protobuf/benchmarks/util/protoc-gen-gogoproto.cc \
../bazel-AutoML-Zero/external/com_google_protobuf/benchmarks/util/protoc-gen-proto2_to_proto3.cc 

CC_DEPS += \
./bazel-AutoML-Zero/external/com_google_protobuf/benchmarks/util/gogo_data_scrubber.d \
./bazel-AutoML-Zero/external/com_google_protobuf/benchmarks/util/proto3_data_stripper.d \
./bazel-AutoML-Zero/external/com_google_protobuf/benchmarks/util/protoc-gen-gogoproto.d \
./bazel-AutoML-Zero/external/com_google_protobuf/benchmarks/util/protoc-gen-proto2_to_proto3.d 

OBJS += \
./bazel-AutoML-Zero/external/com_google_protobuf/benchmarks/util/gogo_data_scrubber.o \
./bazel-AutoML-Zero/external/com_google_protobuf/benchmarks/util/proto3_data_stripper.o \
./bazel-AutoML-Zero/external/com_google_protobuf/benchmarks/util/protoc-gen-gogoproto.o \
./bazel-AutoML-Zero/external/com_google_protobuf/benchmarks/util/protoc-gen-proto2_to_proto3.o 


# Each subdirectory must supply rules for building sources it contributes
bazel-AutoML-Zero/external/com_google_protobuf/benchmarks/util/%.o: ../bazel-AutoML-Zero/external/com_google_protobuf/benchmarks/util/%.cc bazel-AutoML-Zero/external/com_google_protobuf/benchmarks/util/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C++ Compiler'
	g++ -std=c++17 -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


