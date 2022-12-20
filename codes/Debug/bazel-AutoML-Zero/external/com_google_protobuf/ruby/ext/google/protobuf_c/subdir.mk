################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../bazel-AutoML-Zero/external/com_google_protobuf/ruby/ext/google/protobuf_c/defs.c \
../bazel-AutoML-Zero/external/com_google_protobuf/ruby/ext/google/protobuf_c/encode_decode.c \
../bazel-AutoML-Zero/external/com_google_protobuf/ruby/ext/google/protobuf_c/map.c \
../bazel-AutoML-Zero/external/com_google_protobuf/ruby/ext/google/protobuf_c/message.c \
../bazel-AutoML-Zero/external/com_google_protobuf/ruby/ext/google/protobuf_c/protobuf.c \
../bazel-AutoML-Zero/external/com_google_protobuf/ruby/ext/google/protobuf_c/repeated_field.c \
../bazel-AutoML-Zero/external/com_google_protobuf/ruby/ext/google/protobuf_c/storage.c \
../bazel-AutoML-Zero/external/com_google_protobuf/ruby/ext/google/protobuf_c/upb.c \
../bazel-AutoML-Zero/external/com_google_protobuf/ruby/ext/google/protobuf_c/wrap_memcpy.c 

OBJS += \
./bazel-AutoML-Zero/external/com_google_protobuf/ruby/ext/google/protobuf_c/defs.o \
./bazel-AutoML-Zero/external/com_google_protobuf/ruby/ext/google/protobuf_c/encode_decode.o \
./bazel-AutoML-Zero/external/com_google_protobuf/ruby/ext/google/protobuf_c/map.o \
./bazel-AutoML-Zero/external/com_google_protobuf/ruby/ext/google/protobuf_c/message.o \
./bazel-AutoML-Zero/external/com_google_protobuf/ruby/ext/google/protobuf_c/protobuf.o \
./bazel-AutoML-Zero/external/com_google_protobuf/ruby/ext/google/protobuf_c/repeated_field.o \
./bazel-AutoML-Zero/external/com_google_protobuf/ruby/ext/google/protobuf_c/storage.o \
./bazel-AutoML-Zero/external/com_google_protobuf/ruby/ext/google/protobuf_c/upb.o \
./bazel-AutoML-Zero/external/com_google_protobuf/ruby/ext/google/protobuf_c/wrap_memcpy.o 

C_DEPS += \
./bazel-AutoML-Zero/external/com_google_protobuf/ruby/ext/google/protobuf_c/defs.d \
./bazel-AutoML-Zero/external/com_google_protobuf/ruby/ext/google/protobuf_c/encode_decode.d \
./bazel-AutoML-Zero/external/com_google_protobuf/ruby/ext/google/protobuf_c/map.d \
./bazel-AutoML-Zero/external/com_google_protobuf/ruby/ext/google/protobuf_c/message.d \
./bazel-AutoML-Zero/external/com_google_protobuf/ruby/ext/google/protobuf_c/protobuf.d \
./bazel-AutoML-Zero/external/com_google_protobuf/ruby/ext/google/protobuf_c/repeated_field.d \
./bazel-AutoML-Zero/external/com_google_protobuf/ruby/ext/google/protobuf_c/storage.d \
./bazel-AutoML-Zero/external/com_google_protobuf/ruby/ext/google/protobuf_c/upb.d \
./bazel-AutoML-Zero/external/com_google_protobuf/ruby/ext/google/protobuf_c/wrap_memcpy.d 


# Each subdirectory must supply rules for building sources it contributes
bazel-AutoML-Zero/external/com_google_protobuf/ruby/ext/google/protobuf_c/%.o: ../bazel-AutoML-Zero/external/com_google_protobuf/ruby/ext/google/protobuf_c/%.c bazel-AutoML-Zero/external/com_google_protobuf/ruby/ext/google/protobuf_c/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C Compiler'
	gcc -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


