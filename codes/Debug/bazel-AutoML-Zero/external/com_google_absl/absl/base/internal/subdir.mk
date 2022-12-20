################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../bazel-AutoML-Zero/external/com_google_absl/absl/base/internal/atomic_hook_test.cc \
../bazel-AutoML-Zero/external/com_google_absl/absl/base/internal/atomic_hook_test_helper.cc \
../bazel-AutoML-Zero/external/com_google_absl/absl/base/internal/cmake_thread_test.cc \
../bazel-AutoML-Zero/external/com_google_absl/absl/base/internal/cycleclock.cc \
../bazel-AutoML-Zero/external/com_google_absl/absl/base/internal/endian_test.cc \
../bazel-AutoML-Zero/external/com_google_absl/absl/base/internal/errno_saver_test.cc \
../bazel-AutoML-Zero/external/com_google_absl/absl/base/internal/exception_safety_testing.cc \
../bazel-AutoML-Zero/external/com_google_absl/absl/base/internal/exponential_biased.cc \
../bazel-AutoML-Zero/external/com_google_absl/absl/base/internal/exponential_biased_test.cc \
../bazel-AutoML-Zero/external/com_google_absl/absl/base/internal/fast_type_id_test.cc \
../bazel-AutoML-Zero/external/com_google_absl/absl/base/internal/low_level_alloc.cc \
../bazel-AutoML-Zero/external/com_google_absl/absl/base/internal/low_level_alloc_test.cc \
../bazel-AutoML-Zero/external/com_google_absl/absl/base/internal/periodic_sampler.cc \
../bazel-AutoML-Zero/external/com_google_absl/absl/base/internal/periodic_sampler_benchmark.cc \
../bazel-AutoML-Zero/external/com_google_absl/absl/base/internal/periodic_sampler_test.cc \
../bazel-AutoML-Zero/external/com_google_absl/absl/base/internal/raw_logging.cc \
../bazel-AutoML-Zero/external/com_google_absl/absl/base/internal/scoped_set_env.cc \
../bazel-AutoML-Zero/external/com_google_absl/absl/base/internal/scoped_set_env_test.cc \
../bazel-AutoML-Zero/external/com_google_absl/absl/base/internal/spinlock.cc \
../bazel-AutoML-Zero/external/com_google_absl/absl/base/internal/spinlock_benchmark.cc \
../bazel-AutoML-Zero/external/com_google_absl/absl/base/internal/spinlock_wait.cc \
../bazel-AutoML-Zero/external/com_google_absl/absl/base/internal/strerror.cc \
../bazel-AutoML-Zero/external/com_google_absl/absl/base/internal/strerror_benchmark.cc \
../bazel-AutoML-Zero/external/com_google_absl/absl/base/internal/strerror_test.cc \
../bazel-AutoML-Zero/external/com_google_absl/absl/base/internal/sysinfo.cc \
../bazel-AutoML-Zero/external/com_google_absl/absl/base/internal/sysinfo_test.cc \
../bazel-AutoML-Zero/external/com_google_absl/absl/base/internal/thread_identity.cc \
../bazel-AutoML-Zero/external/com_google_absl/absl/base/internal/thread_identity_benchmark.cc \
../bazel-AutoML-Zero/external/com_google_absl/absl/base/internal/thread_identity_test.cc \
../bazel-AutoML-Zero/external/com_google_absl/absl/base/internal/throw_delegate.cc \
../bazel-AutoML-Zero/external/com_google_absl/absl/base/internal/unique_small_name_test.cc \
../bazel-AutoML-Zero/external/com_google_absl/absl/base/internal/unscaledcycleclock.cc 

CC_DEPS += \
./bazel-AutoML-Zero/external/com_google_absl/absl/base/internal/atomic_hook_test.d \
./bazel-AutoML-Zero/external/com_google_absl/absl/base/internal/atomic_hook_test_helper.d \
./bazel-AutoML-Zero/external/com_google_absl/absl/base/internal/cmake_thread_test.d \
./bazel-AutoML-Zero/external/com_google_absl/absl/base/internal/cycleclock.d \
./bazel-AutoML-Zero/external/com_google_absl/absl/base/internal/endian_test.d \
./bazel-AutoML-Zero/external/com_google_absl/absl/base/internal/errno_saver_test.d \
./bazel-AutoML-Zero/external/com_google_absl/absl/base/internal/exception_safety_testing.d \
./bazel-AutoML-Zero/external/com_google_absl/absl/base/internal/exponential_biased.d \
./bazel-AutoML-Zero/external/com_google_absl/absl/base/internal/exponential_biased_test.d \
./bazel-AutoML-Zero/external/com_google_absl/absl/base/internal/fast_type_id_test.d \
./bazel-AutoML-Zero/external/com_google_absl/absl/base/internal/low_level_alloc.d \
./bazel-AutoML-Zero/external/com_google_absl/absl/base/internal/low_level_alloc_test.d \
./bazel-AutoML-Zero/external/com_google_absl/absl/base/internal/periodic_sampler.d \
./bazel-AutoML-Zero/external/com_google_absl/absl/base/internal/periodic_sampler_benchmark.d \
./bazel-AutoML-Zero/external/com_google_absl/absl/base/internal/periodic_sampler_test.d \
./bazel-AutoML-Zero/external/com_google_absl/absl/base/internal/raw_logging.d \
./bazel-AutoML-Zero/external/com_google_absl/absl/base/internal/scoped_set_env.d \
./bazel-AutoML-Zero/external/com_google_absl/absl/base/internal/scoped_set_env_test.d \
./bazel-AutoML-Zero/external/com_google_absl/absl/base/internal/spinlock.d \
./bazel-AutoML-Zero/external/com_google_absl/absl/base/internal/spinlock_benchmark.d \
./bazel-AutoML-Zero/external/com_google_absl/absl/base/internal/spinlock_wait.d \
./bazel-AutoML-Zero/external/com_google_absl/absl/base/internal/strerror.d \
./bazel-AutoML-Zero/external/com_google_absl/absl/base/internal/strerror_benchmark.d \
./bazel-AutoML-Zero/external/com_google_absl/absl/base/internal/strerror_test.d \
./bazel-AutoML-Zero/external/com_google_absl/absl/base/internal/sysinfo.d \
./bazel-AutoML-Zero/external/com_google_absl/absl/base/internal/sysinfo_test.d \
./bazel-AutoML-Zero/external/com_google_absl/absl/base/internal/thread_identity.d \
./bazel-AutoML-Zero/external/com_google_absl/absl/base/internal/thread_identity_benchmark.d \
./bazel-AutoML-Zero/external/com_google_absl/absl/base/internal/thread_identity_test.d \
./bazel-AutoML-Zero/external/com_google_absl/absl/base/internal/throw_delegate.d \
./bazel-AutoML-Zero/external/com_google_absl/absl/base/internal/unique_small_name_test.d \
./bazel-AutoML-Zero/external/com_google_absl/absl/base/internal/unscaledcycleclock.d 

OBJS += \
./bazel-AutoML-Zero/external/com_google_absl/absl/base/internal/atomic_hook_test.o \
./bazel-AutoML-Zero/external/com_google_absl/absl/base/internal/atomic_hook_test_helper.o \
./bazel-AutoML-Zero/external/com_google_absl/absl/base/internal/cmake_thread_test.o \
./bazel-AutoML-Zero/external/com_google_absl/absl/base/internal/cycleclock.o \
./bazel-AutoML-Zero/external/com_google_absl/absl/base/internal/endian_test.o \
./bazel-AutoML-Zero/external/com_google_absl/absl/base/internal/errno_saver_test.o \
./bazel-AutoML-Zero/external/com_google_absl/absl/base/internal/exception_safety_testing.o \
./bazel-AutoML-Zero/external/com_google_absl/absl/base/internal/exponential_biased.o \
./bazel-AutoML-Zero/external/com_google_absl/absl/base/internal/exponential_biased_test.o \
./bazel-AutoML-Zero/external/com_google_absl/absl/base/internal/fast_type_id_test.o \
./bazel-AutoML-Zero/external/com_google_absl/absl/base/internal/low_level_alloc.o \
./bazel-AutoML-Zero/external/com_google_absl/absl/base/internal/low_level_alloc_test.o \
./bazel-AutoML-Zero/external/com_google_absl/absl/base/internal/periodic_sampler.o \
./bazel-AutoML-Zero/external/com_google_absl/absl/base/internal/periodic_sampler_benchmark.o \
./bazel-AutoML-Zero/external/com_google_absl/absl/base/internal/periodic_sampler_test.o \
./bazel-AutoML-Zero/external/com_google_absl/absl/base/internal/raw_logging.o \
./bazel-AutoML-Zero/external/com_google_absl/absl/base/internal/scoped_set_env.o \
./bazel-AutoML-Zero/external/com_google_absl/absl/base/internal/scoped_set_env_test.o \
./bazel-AutoML-Zero/external/com_google_absl/absl/base/internal/spinlock.o \
./bazel-AutoML-Zero/external/com_google_absl/absl/base/internal/spinlock_benchmark.o \
./bazel-AutoML-Zero/external/com_google_absl/absl/base/internal/spinlock_wait.o \
./bazel-AutoML-Zero/external/com_google_absl/absl/base/internal/strerror.o \
./bazel-AutoML-Zero/external/com_google_absl/absl/base/internal/strerror_benchmark.o \
./bazel-AutoML-Zero/external/com_google_absl/absl/base/internal/strerror_test.o \
./bazel-AutoML-Zero/external/com_google_absl/absl/base/internal/sysinfo.o \
./bazel-AutoML-Zero/external/com_google_absl/absl/base/internal/sysinfo_test.o \
./bazel-AutoML-Zero/external/com_google_absl/absl/base/internal/thread_identity.o \
./bazel-AutoML-Zero/external/com_google_absl/absl/base/internal/thread_identity_benchmark.o \
./bazel-AutoML-Zero/external/com_google_absl/absl/base/internal/thread_identity_test.o \
./bazel-AutoML-Zero/external/com_google_absl/absl/base/internal/throw_delegate.o \
./bazel-AutoML-Zero/external/com_google_absl/absl/base/internal/unique_small_name_test.o \
./bazel-AutoML-Zero/external/com_google_absl/absl/base/internal/unscaledcycleclock.o 


# Each subdirectory must supply rules for building sources it contributes
bazel-AutoML-Zero/external/com_google_absl/absl/base/internal/%.o: ../bazel-AutoML-Zero/external/com_google_absl/absl/base/internal/%.cc bazel-AutoML-Zero/external/com_google_absl/absl/base/internal/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C++ Compiler'
	g++ -std=c++17 -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


