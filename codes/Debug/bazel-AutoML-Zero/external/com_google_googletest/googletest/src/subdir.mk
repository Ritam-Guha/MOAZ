################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../bazel-AutoML-Zero/external/com_google_googletest/googletest/src/gtest-all.cc \
../bazel-AutoML-Zero/external/com_google_googletest/googletest/src/gtest-death-test.cc \
../bazel-AutoML-Zero/external/com_google_googletest/googletest/src/gtest-filepath.cc \
../bazel-AutoML-Zero/external/com_google_googletest/googletest/src/gtest-matchers.cc \
../bazel-AutoML-Zero/external/com_google_googletest/googletest/src/gtest-port.cc \
../bazel-AutoML-Zero/external/com_google_googletest/googletest/src/gtest-printers.cc \
../bazel-AutoML-Zero/external/com_google_googletest/googletest/src/gtest-test-part.cc \
../bazel-AutoML-Zero/external/com_google_googletest/googletest/src/gtest-typed-test.cc \
../bazel-AutoML-Zero/external/com_google_googletest/googletest/src/gtest.cc \
../bazel-AutoML-Zero/external/com_google_googletest/googletest/src/gtest_main.cc 

CC_DEPS += \
./bazel-AutoML-Zero/external/com_google_googletest/googletest/src/gtest-all.d \
./bazel-AutoML-Zero/external/com_google_googletest/googletest/src/gtest-death-test.d \
./bazel-AutoML-Zero/external/com_google_googletest/googletest/src/gtest-filepath.d \
./bazel-AutoML-Zero/external/com_google_googletest/googletest/src/gtest-matchers.d \
./bazel-AutoML-Zero/external/com_google_googletest/googletest/src/gtest-port.d \
./bazel-AutoML-Zero/external/com_google_googletest/googletest/src/gtest-printers.d \
./bazel-AutoML-Zero/external/com_google_googletest/googletest/src/gtest-test-part.d \
./bazel-AutoML-Zero/external/com_google_googletest/googletest/src/gtest-typed-test.d \
./bazel-AutoML-Zero/external/com_google_googletest/googletest/src/gtest.d \
./bazel-AutoML-Zero/external/com_google_googletest/googletest/src/gtest_main.d 

OBJS += \
./bazel-AutoML-Zero/external/com_google_googletest/googletest/src/gtest-all.o \
./bazel-AutoML-Zero/external/com_google_googletest/googletest/src/gtest-death-test.o \
./bazel-AutoML-Zero/external/com_google_googletest/googletest/src/gtest-filepath.o \
./bazel-AutoML-Zero/external/com_google_googletest/googletest/src/gtest-matchers.o \
./bazel-AutoML-Zero/external/com_google_googletest/googletest/src/gtest-port.o \
./bazel-AutoML-Zero/external/com_google_googletest/googletest/src/gtest-printers.o \
./bazel-AutoML-Zero/external/com_google_googletest/googletest/src/gtest-test-part.o \
./bazel-AutoML-Zero/external/com_google_googletest/googletest/src/gtest-typed-test.o \
./bazel-AutoML-Zero/external/com_google_googletest/googletest/src/gtest.o \
./bazel-AutoML-Zero/external/com_google_googletest/googletest/src/gtest_main.o 


# Each subdirectory must supply rules for building sources it contributes
bazel-AutoML-Zero/external/com_google_googletest/googletest/src/%.o: ../bazel-AutoML-Zero/external/com_google_googletest/googletest/src/%.cc bazel-AutoML-Zero/external/com_google_googletest/googletest/src/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C++ Compiler'
	g++ -std=c++17 -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


