################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../bazel-AutoML-Zero/external/com_google_googletest/googletest/samples/sample1.cc \
../bazel-AutoML-Zero/external/com_google_googletest/googletest/samples/sample10_unittest.cc \
../bazel-AutoML-Zero/external/com_google_googletest/googletest/samples/sample1_unittest.cc \
../bazel-AutoML-Zero/external/com_google_googletest/googletest/samples/sample2.cc \
../bazel-AutoML-Zero/external/com_google_googletest/googletest/samples/sample2_unittest.cc \
../bazel-AutoML-Zero/external/com_google_googletest/googletest/samples/sample3_unittest.cc \
../bazel-AutoML-Zero/external/com_google_googletest/googletest/samples/sample4.cc \
../bazel-AutoML-Zero/external/com_google_googletest/googletest/samples/sample4_unittest.cc \
../bazel-AutoML-Zero/external/com_google_googletest/googletest/samples/sample5_unittest.cc \
../bazel-AutoML-Zero/external/com_google_googletest/googletest/samples/sample6_unittest.cc \
../bazel-AutoML-Zero/external/com_google_googletest/googletest/samples/sample7_unittest.cc \
../bazel-AutoML-Zero/external/com_google_googletest/googletest/samples/sample8_unittest.cc \
../bazel-AutoML-Zero/external/com_google_googletest/googletest/samples/sample9_unittest.cc 

CC_DEPS += \
./bazel-AutoML-Zero/external/com_google_googletest/googletest/samples/sample1.d \
./bazel-AutoML-Zero/external/com_google_googletest/googletest/samples/sample10_unittest.d \
./bazel-AutoML-Zero/external/com_google_googletest/googletest/samples/sample1_unittest.d \
./bazel-AutoML-Zero/external/com_google_googletest/googletest/samples/sample2.d \
./bazel-AutoML-Zero/external/com_google_googletest/googletest/samples/sample2_unittest.d \
./bazel-AutoML-Zero/external/com_google_googletest/googletest/samples/sample3_unittest.d \
./bazel-AutoML-Zero/external/com_google_googletest/googletest/samples/sample4.d \
./bazel-AutoML-Zero/external/com_google_googletest/googletest/samples/sample4_unittest.d \
./bazel-AutoML-Zero/external/com_google_googletest/googletest/samples/sample5_unittest.d \
./bazel-AutoML-Zero/external/com_google_googletest/googletest/samples/sample6_unittest.d \
./bazel-AutoML-Zero/external/com_google_googletest/googletest/samples/sample7_unittest.d \
./bazel-AutoML-Zero/external/com_google_googletest/googletest/samples/sample8_unittest.d \
./bazel-AutoML-Zero/external/com_google_googletest/googletest/samples/sample9_unittest.d 

OBJS += \
./bazel-AutoML-Zero/external/com_google_googletest/googletest/samples/sample1.o \
./bazel-AutoML-Zero/external/com_google_googletest/googletest/samples/sample10_unittest.o \
./bazel-AutoML-Zero/external/com_google_googletest/googletest/samples/sample1_unittest.o \
./bazel-AutoML-Zero/external/com_google_googletest/googletest/samples/sample2.o \
./bazel-AutoML-Zero/external/com_google_googletest/googletest/samples/sample2_unittest.o \
./bazel-AutoML-Zero/external/com_google_googletest/googletest/samples/sample3_unittest.o \
./bazel-AutoML-Zero/external/com_google_googletest/googletest/samples/sample4.o \
./bazel-AutoML-Zero/external/com_google_googletest/googletest/samples/sample4_unittest.o \
./bazel-AutoML-Zero/external/com_google_googletest/googletest/samples/sample5_unittest.o \
./bazel-AutoML-Zero/external/com_google_googletest/googletest/samples/sample6_unittest.o \
./bazel-AutoML-Zero/external/com_google_googletest/googletest/samples/sample7_unittest.o \
./bazel-AutoML-Zero/external/com_google_googletest/googletest/samples/sample8_unittest.o \
./bazel-AutoML-Zero/external/com_google_googletest/googletest/samples/sample9_unittest.o 


# Each subdirectory must supply rules for building sources it contributes
bazel-AutoML-Zero/external/com_google_googletest/googletest/samples/%.o: ../bazel-AutoML-Zero/external/com_google_googletest/googletest/samples/%.cc bazel-AutoML-Zero/external/com_google_googletest/googletest/samples/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C++ Compiler'
	g++ -std=c++17 -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


