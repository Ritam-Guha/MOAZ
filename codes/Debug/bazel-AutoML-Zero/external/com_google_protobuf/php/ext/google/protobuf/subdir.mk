################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../bazel-AutoML-Zero/external/com_google_protobuf/php/ext/google/protobuf/array.c \
../bazel-AutoML-Zero/external/com_google_protobuf/php/ext/google/protobuf/def.c \
../bazel-AutoML-Zero/external/com_google_protobuf/php/ext/google/protobuf/encode_decode.c \
../bazel-AutoML-Zero/external/com_google_protobuf/php/ext/google/protobuf/map.c \
../bazel-AutoML-Zero/external/com_google_protobuf/php/ext/google/protobuf/message.c \
../bazel-AutoML-Zero/external/com_google_protobuf/php/ext/google/protobuf/protobuf.c \
../bazel-AutoML-Zero/external/com_google_protobuf/php/ext/google/protobuf/storage.c \
../bazel-AutoML-Zero/external/com_google_protobuf/php/ext/google/protobuf/type_check.c \
../bazel-AutoML-Zero/external/com_google_protobuf/php/ext/google/protobuf/upb.c \
../bazel-AutoML-Zero/external/com_google_protobuf/php/ext/google/protobuf/utf8.c 

OBJS += \
./bazel-AutoML-Zero/external/com_google_protobuf/php/ext/google/protobuf/array.o \
./bazel-AutoML-Zero/external/com_google_protobuf/php/ext/google/protobuf/def.o \
./bazel-AutoML-Zero/external/com_google_protobuf/php/ext/google/protobuf/encode_decode.o \
./bazel-AutoML-Zero/external/com_google_protobuf/php/ext/google/protobuf/map.o \
./bazel-AutoML-Zero/external/com_google_protobuf/php/ext/google/protobuf/message.o \
./bazel-AutoML-Zero/external/com_google_protobuf/php/ext/google/protobuf/protobuf.o \
./bazel-AutoML-Zero/external/com_google_protobuf/php/ext/google/protobuf/storage.o \
./bazel-AutoML-Zero/external/com_google_protobuf/php/ext/google/protobuf/type_check.o \
./bazel-AutoML-Zero/external/com_google_protobuf/php/ext/google/protobuf/upb.o \
./bazel-AutoML-Zero/external/com_google_protobuf/php/ext/google/protobuf/utf8.o 

C_DEPS += \
./bazel-AutoML-Zero/external/com_google_protobuf/php/ext/google/protobuf/array.d \
./bazel-AutoML-Zero/external/com_google_protobuf/php/ext/google/protobuf/def.d \
./bazel-AutoML-Zero/external/com_google_protobuf/php/ext/google/protobuf/encode_decode.d \
./bazel-AutoML-Zero/external/com_google_protobuf/php/ext/google/protobuf/map.d \
./bazel-AutoML-Zero/external/com_google_protobuf/php/ext/google/protobuf/message.d \
./bazel-AutoML-Zero/external/com_google_protobuf/php/ext/google/protobuf/protobuf.d \
./bazel-AutoML-Zero/external/com_google_protobuf/php/ext/google/protobuf/storage.d \
./bazel-AutoML-Zero/external/com_google_protobuf/php/ext/google/protobuf/type_check.d \
./bazel-AutoML-Zero/external/com_google_protobuf/php/ext/google/protobuf/upb.d \
./bazel-AutoML-Zero/external/com_google_protobuf/php/ext/google/protobuf/utf8.d 


# Each subdirectory must supply rules for building sources it contributes
bazel-AutoML-Zero/external/com_google_protobuf/php/ext/google/protobuf/%.o: ../bazel-AutoML-Zero/external/com_google_protobuf/php/ext/google/protobuf/%.c bazel-AutoML-Zero/external/com_google_protobuf/php/ext/google/protobuf/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C Compiler'
	gcc -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


