################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../bazel-AutoML-Zero/external/com_google_googletest/googlemock/src/gmock-all.cc \
../bazel-AutoML-Zero/external/com_google_googletest/googlemock/src/gmock-cardinalities.cc \
../bazel-AutoML-Zero/external/com_google_googletest/googlemock/src/gmock-internal-utils.cc \
../bazel-AutoML-Zero/external/com_google_googletest/googlemock/src/gmock-matchers.cc \
../bazel-AutoML-Zero/external/com_google_googletest/googlemock/src/gmock-spec-builders.cc \
../bazel-AutoML-Zero/external/com_google_googletest/googlemock/src/gmock.cc \
../bazel-AutoML-Zero/external/com_google_googletest/googlemock/src/gmock_main.cc 

CC_DEPS += \
./bazel-AutoML-Zero/external/com_google_googletest/googlemock/src/gmock-all.d \
./bazel-AutoML-Zero/external/com_google_googletest/googlemock/src/gmock-cardinalities.d \
./bazel-AutoML-Zero/external/com_google_googletest/googlemock/src/gmock-internal-utils.d \
./bazel-AutoML-Zero/external/com_google_googletest/googlemock/src/gmock-matchers.d \
./bazel-AutoML-Zero/external/com_google_googletest/googlemock/src/gmock-spec-builders.d \
./bazel-AutoML-Zero/external/com_google_googletest/googlemock/src/gmock.d \
./bazel-AutoML-Zero/external/com_google_googletest/googlemock/src/gmock_main.d 

OBJS += \
./bazel-AutoML-Zero/external/com_google_googletest/googlemock/src/gmock-all.o \
./bazel-AutoML-Zero/external/com_google_googletest/googlemock/src/gmock-cardinalities.o \
./bazel-AutoML-Zero/external/com_google_googletest/googlemock/src/gmock-internal-utils.o \
./bazel-AutoML-Zero/external/com_google_googletest/googlemock/src/gmock-matchers.o \
./bazel-AutoML-Zero/external/com_google_googletest/googlemock/src/gmock-spec-builders.o \
./bazel-AutoML-Zero/external/com_google_googletest/googlemock/src/gmock.o \
./bazel-AutoML-Zero/external/com_google_googletest/googlemock/src/gmock_main.o 


# Each subdirectory must supply rules for building sources it contributes
bazel-AutoML-Zero/external/com_google_googletest/googlemock/src/%.o: ../bazel-AutoML-Zero/external/com_google_googletest/googlemock/src/%.cc bazel-AutoML-Zero/external/com_google_googletest/googlemock/src/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C++ Compiler'
	g++ -std=c++17 -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


