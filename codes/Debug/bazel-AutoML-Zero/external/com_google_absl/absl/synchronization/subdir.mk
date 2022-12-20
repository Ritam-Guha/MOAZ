################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../bazel-AutoML-Zero/external/com_google_absl/absl/synchronization/barrier.cc \
../bazel-AutoML-Zero/external/com_google_absl/absl/synchronization/barrier_test.cc \
../bazel-AutoML-Zero/external/com_google_absl/absl/synchronization/blocking_counter.cc \
../bazel-AutoML-Zero/external/com_google_absl/absl/synchronization/blocking_counter_benchmark.cc \
../bazel-AutoML-Zero/external/com_google_absl/absl/synchronization/blocking_counter_test.cc \
../bazel-AutoML-Zero/external/com_google_absl/absl/synchronization/lifetime_test.cc \
../bazel-AutoML-Zero/external/com_google_absl/absl/synchronization/mutex.cc \
../bazel-AutoML-Zero/external/com_google_absl/absl/synchronization/mutex_benchmark.cc \
../bazel-AutoML-Zero/external/com_google_absl/absl/synchronization/mutex_test.cc \
../bazel-AutoML-Zero/external/com_google_absl/absl/synchronization/notification.cc \
../bazel-AutoML-Zero/external/com_google_absl/absl/synchronization/notification_test.cc 

CC_DEPS += \
./bazel-AutoML-Zero/external/com_google_absl/absl/synchronization/barrier.d \
./bazel-AutoML-Zero/external/com_google_absl/absl/synchronization/barrier_test.d \
./bazel-AutoML-Zero/external/com_google_absl/absl/synchronization/blocking_counter.d \
./bazel-AutoML-Zero/external/com_google_absl/absl/synchronization/blocking_counter_benchmark.d \
./bazel-AutoML-Zero/external/com_google_absl/absl/synchronization/blocking_counter_test.d \
./bazel-AutoML-Zero/external/com_google_absl/absl/synchronization/lifetime_test.d \
./bazel-AutoML-Zero/external/com_google_absl/absl/synchronization/mutex.d \
./bazel-AutoML-Zero/external/com_google_absl/absl/synchronization/mutex_benchmark.d \
./bazel-AutoML-Zero/external/com_google_absl/absl/synchronization/mutex_test.d \
./bazel-AutoML-Zero/external/com_google_absl/absl/synchronization/notification.d \
./bazel-AutoML-Zero/external/com_google_absl/absl/synchronization/notification_test.d 

OBJS += \
./bazel-AutoML-Zero/external/com_google_absl/absl/synchronization/barrier.o \
./bazel-AutoML-Zero/external/com_google_absl/absl/synchronization/barrier_test.o \
./bazel-AutoML-Zero/external/com_google_absl/absl/synchronization/blocking_counter.o \
./bazel-AutoML-Zero/external/com_google_absl/absl/synchronization/blocking_counter_benchmark.o \
./bazel-AutoML-Zero/external/com_google_absl/absl/synchronization/blocking_counter_test.o \
./bazel-AutoML-Zero/external/com_google_absl/absl/synchronization/lifetime_test.o \
./bazel-AutoML-Zero/external/com_google_absl/absl/synchronization/mutex.o \
./bazel-AutoML-Zero/external/com_google_absl/absl/synchronization/mutex_benchmark.o \
./bazel-AutoML-Zero/external/com_google_absl/absl/synchronization/mutex_test.o \
./bazel-AutoML-Zero/external/com_google_absl/absl/synchronization/notification.o \
./bazel-AutoML-Zero/external/com_google_absl/absl/synchronization/notification_test.o 


# Each subdirectory must supply rules for building sources it contributes
bazel-AutoML-Zero/external/com_google_absl/absl/synchronization/%.o: ../bazel-AutoML-Zero/external/com_google_absl/absl/synchronization/%.cc bazel-AutoML-Zero/external/com_google_absl/absl/synchronization/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C++ Compiler'
	g++ -std=c++17 -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


