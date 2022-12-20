################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../bazel-AutoML-Zero/external/com_google_protobuf/python/google/protobuf/pyext/descriptor.cc \
../bazel-AutoML-Zero/external/com_google_protobuf/python/google/protobuf/pyext/descriptor_containers.cc \
../bazel-AutoML-Zero/external/com_google_protobuf/python/google/protobuf/pyext/descriptor_database.cc \
../bazel-AutoML-Zero/external/com_google_protobuf/python/google/protobuf/pyext/descriptor_pool.cc \
../bazel-AutoML-Zero/external/com_google_protobuf/python/google/protobuf/pyext/extension_dict.cc \
../bazel-AutoML-Zero/external/com_google_protobuf/python/google/protobuf/pyext/field.cc \
../bazel-AutoML-Zero/external/com_google_protobuf/python/google/protobuf/pyext/map_container.cc \
../bazel-AutoML-Zero/external/com_google_protobuf/python/google/protobuf/pyext/message.cc \
../bazel-AutoML-Zero/external/com_google_protobuf/python/google/protobuf/pyext/message_factory.cc \
../bazel-AutoML-Zero/external/com_google_protobuf/python/google/protobuf/pyext/message_module.cc \
../bazel-AutoML-Zero/external/com_google_protobuf/python/google/protobuf/pyext/repeated_composite_container.cc \
../bazel-AutoML-Zero/external/com_google_protobuf/python/google/protobuf/pyext/repeated_scalar_container.cc \
../bazel-AutoML-Zero/external/com_google_protobuf/python/google/protobuf/pyext/unknown_fields.cc 

CC_DEPS += \
./bazel-AutoML-Zero/external/com_google_protobuf/python/google/protobuf/pyext/descriptor.d \
./bazel-AutoML-Zero/external/com_google_protobuf/python/google/protobuf/pyext/descriptor_containers.d \
./bazel-AutoML-Zero/external/com_google_protobuf/python/google/protobuf/pyext/descriptor_database.d \
./bazel-AutoML-Zero/external/com_google_protobuf/python/google/protobuf/pyext/descriptor_pool.d \
./bazel-AutoML-Zero/external/com_google_protobuf/python/google/protobuf/pyext/extension_dict.d \
./bazel-AutoML-Zero/external/com_google_protobuf/python/google/protobuf/pyext/field.d \
./bazel-AutoML-Zero/external/com_google_protobuf/python/google/protobuf/pyext/map_container.d \
./bazel-AutoML-Zero/external/com_google_protobuf/python/google/protobuf/pyext/message.d \
./bazel-AutoML-Zero/external/com_google_protobuf/python/google/protobuf/pyext/message_factory.d \
./bazel-AutoML-Zero/external/com_google_protobuf/python/google/protobuf/pyext/message_module.d \
./bazel-AutoML-Zero/external/com_google_protobuf/python/google/protobuf/pyext/repeated_composite_container.d \
./bazel-AutoML-Zero/external/com_google_protobuf/python/google/protobuf/pyext/repeated_scalar_container.d \
./bazel-AutoML-Zero/external/com_google_protobuf/python/google/protobuf/pyext/unknown_fields.d 

OBJS += \
./bazel-AutoML-Zero/external/com_google_protobuf/python/google/protobuf/pyext/descriptor.o \
./bazel-AutoML-Zero/external/com_google_protobuf/python/google/protobuf/pyext/descriptor_containers.o \
./bazel-AutoML-Zero/external/com_google_protobuf/python/google/protobuf/pyext/descriptor_database.o \
./bazel-AutoML-Zero/external/com_google_protobuf/python/google/protobuf/pyext/descriptor_pool.o \
./bazel-AutoML-Zero/external/com_google_protobuf/python/google/protobuf/pyext/extension_dict.o \
./bazel-AutoML-Zero/external/com_google_protobuf/python/google/protobuf/pyext/field.o \
./bazel-AutoML-Zero/external/com_google_protobuf/python/google/protobuf/pyext/map_container.o \
./bazel-AutoML-Zero/external/com_google_protobuf/python/google/protobuf/pyext/message.o \
./bazel-AutoML-Zero/external/com_google_protobuf/python/google/protobuf/pyext/message_factory.o \
./bazel-AutoML-Zero/external/com_google_protobuf/python/google/protobuf/pyext/message_module.o \
./bazel-AutoML-Zero/external/com_google_protobuf/python/google/protobuf/pyext/repeated_composite_container.o \
./bazel-AutoML-Zero/external/com_google_protobuf/python/google/protobuf/pyext/repeated_scalar_container.o \
./bazel-AutoML-Zero/external/com_google_protobuf/python/google/protobuf/pyext/unknown_fields.o 


# Each subdirectory must supply rules for building sources it contributes
bazel-AutoML-Zero/external/com_google_protobuf/python/google/protobuf/pyext/%.o: ../bazel-AutoML-Zero/external/com_google_protobuf/python/google/protobuf/pyext/%.cc bazel-AutoML-Zero/external/com_google_protobuf/python/google/protobuf/pyext/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C++ Compiler'
	g++ -std=c++17 -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


