################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../bazel-AutoML-Zero/external/com_google_glog/src/demangle.cc \
../bazel-AutoML-Zero/external/com_google_glog/src/demangle_unittest.cc \
../bazel-AutoML-Zero/external/com_google_glog/src/logging.cc \
../bazel-AutoML-Zero/external/com_google_glog/src/logging_custom_prefix_unittest.cc \
../bazel-AutoML-Zero/external/com_google_glog/src/logging_striptest10.cc \
../bazel-AutoML-Zero/external/com_google_glog/src/logging_striptest2.cc \
../bazel-AutoML-Zero/external/com_google_glog/src/logging_striptest_main.cc \
../bazel-AutoML-Zero/external/com_google_glog/src/logging_unittest.cc \
../bazel-AutoML-Zero/external/com_google_glog/src/mock-log_test.cc \
../bazel-AutoML-Zero/external/com_google_glog/src/raw_logging.cc \
../bazel-AutoML-Zero/external/com_google_glog/src/signalhandler.cc \
../bazel-AutoML-Zero/external/com_google_glog/src/signalhandler_unittest.cc \
../bazel-AutoML-Zero/external/com_google_glog/src/stacktrace_unittest.cc \
../bazel-AutoML-Zero/external/com_google_glog/src/stl_logging_unittest.cc \
../bazel-AutoML-Zero/external/com_google_glog/src/symbolize.cc \
../bazel-AutoML-Zero/external/com_google_glog/src/symbolize_unittest.cc \
../bazel-AutoML-Zero/external/com_google_glog/src/utilities.cc \
../bazel-AutoML-Zero/external/com_google_glog/src/utilities_unittest.cc \
../bazel-AutoML-Zero/external/com_google_glog/src/vlog_is_on.cc 

CC_DEPS += \
./bazel-AutoML-Zero/external/com_google_glog/src/demangle.d \
./bazel-AutoML-Zero/external/com_google_glog/src/demangle_unittest.d \
./bazel-AutoML-Zero/external/com_google_glog/src/logging.d \
./bazel-AutoML-Zero/external/com_google_glog/src/logging_custom_prefix_unittest.d \
./bazel-AutoML-Zero/external/com_google_glog/src/logging_striptest10.d \
./bazel-AutoML-Zero/external/com_google_glog/src/logging_striptest2.d \
./bazel-AutoML-Zero/external/com_google_glog/src/logging_striptest_main.d \
./bazel-AutoML-Zero/external/com_google_glog/src/logging_unittest.d \
./bazel-AutoML-Zero/external/com_google_glog/src/mock-log_test.d \
./bazel-AutoML-Zero/external/com_google_glog/src/raw_logging.d \
./bazel-AutoML-Zero/external/com_google_glog/src/signalhandler.d \
./bazel-AutoML-Zero/external/com_google_glog/src/signalhandler_unittest.d \
./bazel-AutoML-Zero/external/com_google_glog/src/stacktrace_unittest.d \
./bazel-AutoML-Zero/external/com_google_glog/src/stl_logging_unittest.d \
./bazel-AutoML-Zero/external/com_google_glog/src/symbolize.d \
./bazel-AutoML-Zero/external/com_google_glog/src/symbolize_unittest.d \
./bazel-AutoML-Zero/external/com_google_glog/src/utilities.d \
./bazel-AutoML-Zero/external/com_google_glog/src/utilities_unittest.d \
./bazel-AutoML-Zero/external/com_google_glog/src/vlog_is_on.d 

OBJS += \
./bazel-AutoML-Zero/external/com_google_glog/src/demangle.o \
./bazel-AutoML-Zero/external/com_google_glog/src/demangle_unittest.o \
./bazel-AutoML-Zero/external/com_google_glog/src/logging.o \
./bazel-AutoML-Zero/external/com_google_glog/src/logging_custom_prefix_unittest.o \
./bazel-AutoML-Zero/external/com_google_glog/src/logging_striptest10.o \
./bazel-AutoML-Zero/external/com_google_glog/src/logging_striptest2.o \
./bazel-AutoML-Zero/external/com_google_glog/src/logging_striptest_main.o \
./bazel-AutoML-Zero/external/com_google_glog/src/logging_unittest.o \
./bazel-AutoML-Zero/external/com_google_glog/src/mock-log_test.o \
./bazel-AutoML-Zero/external/com_google_glog/src/raw_logging.o \
./bazel-AutoML-Zero/external/com_google_glog/src/signalhandler.o \
./bazel-AutoML-Zero/external/com_google_glog/src/signalhandler_unittest.o \
./bazel-AutoML-Zero/external/com_google_glog/src/stacktrace_unittest.o \
./bazel-AutoML-Zero/external/com_google_glog/src/stl_logging_unittest.o \
./bazel-AutoML-Zero/external/com_google_glog/src/symbolize.o \
./bazel-AutoML-Zero/external/com_google_glog/src/symbolize_unittest.o \
./bazel-AutoML-Zero/external/com_google_glog/src/utilities.o \
./bazel-AutoML-Zero/external/com_google_glog/src/utilities_unittest.o \
./bazel-AutoML-Zero/external/com_google_glog/src/vlog_is_on.o 


# Each subdirectory must supply rules for building sources it contributes
bazel-AutoML-Zero/external/com_google_glog/src/%.o: ../bazel-AutoML-Zero/external/com_google_glog/src/%.cc bazel-AutoML-Zero/external/com_google_glog/src/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C++ Compiler'
	g++ -std=c++17 -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


