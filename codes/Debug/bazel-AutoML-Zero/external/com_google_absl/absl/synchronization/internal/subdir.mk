################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../bazel-AutoML-Zero/external/com_google_absl/absl/synchronization/internal/create_thread_identity.cc \
../bazel-AutoML-Zero/external/com_google_absl/absl/synchronization/internal/graphcycles.cc \
../bazel-AutoML-Zero/external/com_google_absl/absl/synchronization/internal/graphcycles_benchmark.cc \
../bazel-AutoML-Zero/external/com_google_absl/absl/synchronization/internal/graphcycles_test.cc \
../bazel-AutoML-Zero/external/com_google_absl/absl/synchronization/internal/per_thread_sem.cc \
../bazel-AutoML-Zero/external/com_google_absl/absl/synchronization/internal/per_thread_sem_test.cc \
../bazel-AutoML-Zero/external/com_google_absl/absl/synchronization/internal/waiter.cc 

CC_DEPS += \
./bazel-AutoML-Zero/external/com_google_absl/absl/synchronization/internal/create_thread_identity.d \
./bazel-AutoML-Zero/external/com_google_absl/absl/synchronization/internal/graphcycles.d \
./bazel-AutoML-Zero/external/com_google_absl/absl/synchronization/internal/graphcycles_benchmark.d \
./bazel-AutoML-Zero/external/com_google_absl/absl/synchronization/internal/graphcycles_test.d \
./bazel-AutoML-Zero/external/com_google_absl/absl/synchronization/internal/per_thread_sem.d \
./bazel-AutoML-Zero/external/com_google_absl/absl/synchronization/internal/per_thread_sem_test.d \
./bazel-AutoML-Zero/external/com_google_absl/absl/synchronization/internal/waiter.d 

OBJS += \
./bazel-AutoML-Zero/external/com_google_absl/absl/synchronization/internal/create_thread_identity.o \
./bazel-AutoML-Zero/external/com_google_absl/absl/synchronization/internal/graphcycles.o \
./bazel-AutoML-Zero/external/com_google_absl/absl/synchronization/internal/graphcycles_benchmark.o \
./bazel-AutoML-Zero/external/com_google_absl/absl/synchronization/internal/graphcycles_test.o \
./bazel-AutoML-Zero/external/com_google_absl/absl/synchronization/internal/per_thread_sem.o \
./bazel-AutoML-Zero/external/com_google_absl/absl/synchronization/internal/per_thread_sem_test.o \
./bazel-AutoML-Zero/external/com_google_absl/absl/synchronization/internal/waiter.o 


# Each subdirectory must supply rules for building sources it contributes
bazel-AutoML-Zero/external/com_google_absl/absl/synchronization/internal/%.o: ../bazel-AutoML-Zero/external/com_google_absl/absl/synchronization/internal/%.cc bazel-AutoML-Zero/external/com_google_absl/absl/synchronization/internal/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C++ Compiler'
	g++ -std=c++17 -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


