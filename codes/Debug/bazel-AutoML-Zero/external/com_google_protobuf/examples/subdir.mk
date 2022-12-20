################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../bazel-AutoML-Zero/external/com_google_protobuf/examples/add_person.cc \
../bazel-AutoML-Zero/external/com_google_protobuf/examples/list_people.cc 

CC_DEPS += \
./bazel-AutoML-Zero/external/com_google_protobuf/examples/add_person.d \
./bazel-AutoML-Zero/external/com_google_protobuf/examples/list_people.d 

OBJS += \
./bazel-AutoML-Zero/external/com_google_protobuf/examples/add_person.o \
./bazel-AutoML-Zero/external/com_google_protobuf/examples/list_people.o 


# Each subdirectory must supply rules for building sources it contributes
bazel-AutoML-Zero/external/com_google_protobuf/examples/%.o: ../bazel-AutoML-Zero/external/com_google_protobuf/examples/%.cc bazel-AutoML-Zero/external/com_google_protobuf/examples/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C++ Compiler'
	g++ -std=c++17 -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


