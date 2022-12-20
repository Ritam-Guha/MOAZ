################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CPP_SRCS += \
../bazel-AutoML-Zero/external/com_google_protobuf/conformance/third_party/jsoncpp/jsoncpp.cpp 

OBJS += \
./bazel-AutoML-Zero/external/com_google_protobuf/conformance/third_party/jsoncpp/jsoncpp.o 

CPP_DEPS += \
./bazel-AutoML-Zero/external/com_google_protobuf/conformance/third_party/jsoncpp/jsoncpp.d 


# Each subdirectory must supply rules for building sources it contributes
bazel-AutoML-Zero/external/com_google_protobuf/conformance/third_party/jsoncpp/%.o: ../bazel-AutoML-Zero/external/com_google_protobuf/conformance/third_party/jsoncpp/%.cpp bazel-AutoML-Zero/external/com_google_protobuf/conformance/third_party/jsoncpp/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C++ Compiler'
	g++ -std=c++17 -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


