################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../bazel-AutoML-Zero/external/com_google_absl/absl/types/any_exception_safety_test.cc \
../bazel-AutoML-Zero/external/com_google_absl/absl/types/any_test.cc \
../bazel-AutoML-Zero/external/com_google_absl/absl/types/bad_any_cast.cc \
../bazel-AutoML-Zero/external/com_google_absl/absl/types/bad_optional_access.cc \
../bazel-AutoML-Zero/external/com_google_absl/absl/types/bad_variant_access.cc \
../bazel-AutoML-Zero/external/com_google_absl/absl/types/compare_test.cc \
../bazel-AutoML-Zero/external/com_google_absl/absl/types/optional_exception_safety_test.cc \
../bazel-AutoML-Zero/external/com_google_absl/absl/types/optional_test.cc \
../bazel-AutoML-Zero/external/com_google_absl/absl/types/span_test.cc \
../bazel-AutoML-Zero/external/com_google_absl/absl/types/variant_benchmark.cc \
../bazel-AutoML-Zero/external/com_google_absl/absl/types/variant_exception_safety_test.cc \
../bazel-AutoML-Zero/external/com_google_absl/absl/types/variant_test.cc 

CC_DEPS += \
./bazel-AutoML-Zero/external/com_google_absl/absl/types/any_exception_safety_test.d \
./bazel-AutoML-Zero/external/com_google_absl/absl/types/any_test.d \
./bazel-AutoML-Zero/external/com_google_absl/absl/types/bad_any_cast.d \
./bazel-AutoML-Zero/external/com_google_absl/absl/types/bad_optional_access.d \
./bazel-AutoML-Zero/external/com_google_absl/absl/types/bad_variant_access.d \
./bazel-AutoML-Zero/external/com_google_absl/absl/types/compare_test.d \
./bazel-AutoML-Zero/external/com_google_absl/absl/types/optional_exception_safety_test.d \
./bazel-AutoML-Zero/external/com_google_absl/absl/types/optional_test.d \
./bazel-AutoML-Zero/external/com_google_absl/absl/types/span_test.d \
./bazel-AutoML-Zero/external/com_google_absl/absl/types/variant_benchmark.d \
./bazel-AutoML-Zero/external/com_google_absl/absl/types/variant_exception_safety_test.d \
./bazel-AutoML-Zero/external/com_google_absl/absl/types/variant_test.d 

OBJS += \
./bazel-AutoML-Zero/external/com_google_absl/absl/types/any_exception_safety_test.o \
./bazel-AutoML-Zero/external/com_google_absl/absl/types/any_test.o \
./bazel-AutoML-Zero/external/com_google_absl/absl/types/bad_any_cast.o \
./bazel-AutoML-Zero/external/com_google_absl/absl/types/bad_optional_access.o \
./bazel-AutoML-Zero/external/com_google_absl/absl/types/bad_variant_access.o \
./bazel-AutoML-Zero/external/com_google_absl/absl/types/compare_test.o \
./bazel-AutoML-Zero/external/com_google_absl/absl/types/optional_exception_safety_test.o \
./bazel-AutoML-Zero/external/com_google_absl/absl/types/optional_test.o \
./bazel-AutoML-Zero/external/com_google_absl/absl/types/span_test.o \
./bazel-AutoML-Zero/external/com_google_absl/absl/types/variant_benchmark.o \
./bazel-AutoML-Zero/external/com_google_absl/absl/types/variant_exception_safety_test.o \
./bazel-AutoML-Zero/external/com_google_absl/absl/types/variant_test.o 


# Each subdirectory must supply rules for building sources it contributes
bazel-AutoML-Zero/external/com_google_absl/absl/types/%.o: ../bazel-AutoML-Zero/external/com_google_absl/absl/types/%.cc bazel-AutoML-Zero/external/com_google_absl/absl/types/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C++ Compiler'
	g++ -std=c++17 -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


