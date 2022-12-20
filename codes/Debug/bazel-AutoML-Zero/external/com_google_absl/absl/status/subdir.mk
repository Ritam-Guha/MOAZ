################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../bazel-AutoML-Zero/external/com_google_absl/absl/status/status.cc \
../bazel-AutoML-Zero/external/com_google_absl/absl/status/status_payload_printer.cc \
../bazel-AutoML-Zero/external/com_google_absl/absl/status/status_test.cc \
../bazel-AutoML-Zero/external/com_google_absl/absl/status/statusor.cc \
../bazel-AutoML-Zero/external/com_google_absl/absl/status/statusor_test.cc 

CC_DEPS += \
./bazel-AutoML-Zero/external/com_google_absl/absl/status/status.d \
./bazel-AutoML-Zero/external/com_google_absl/absl/status/status_payload_printer.d \
./bazel-AutoML-Zero/external/com_google_absl/absl/status/status_test.d \
./bazel-AutoML-Zero/external/com_google_absl/absl/status/statusor.d \
./bazel-AutoML-Zero/external/com_google_absl/absl/status/statusor_test.d 

OBJS += \
./bazel-AutoML-Zero/external/com_google_absl/absl/status/status.o \
./bazel-AutoML-Zero/external/com_google_absl/absl/status/status_payload_printer.o \
./bazel-AutoML-Zero/external/com_google_absl/absl/status/status_test.o \
./bazel-AutoML-Zero/external/com_google_absl/absl/status/statusor.o \
./bazel-AutoML-Zero/external/com_google_absl/absl/status/statusor_test.o 


# Each subdirectory must supply rules for building sources it contributes
bazel-AutoML-Zero/external/com_google_absl/absl/status/%.o: ../bazel-AutoML-Zero/external/com_google_absl/absl/status/%.cc bazel-AutoML-Zero/external/com_google_absl/absl/status/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C++ Compiler'
	g++ -std=c++17 -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


