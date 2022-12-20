################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CXX_SRCS += \
../bazel-AutoML-Zero/external/eigen_archive/bench/btl/data/mean.cxx \
../bazel-AutoML-Zero/external/eigen_archive/bench/btl/data/regularize.cxx \
../bazel-AutoML-Zero/external/eigen_archive/bench/btl/data/smooth.cxx 

CXX_DEPS += \
./bazel-AutoML-Zero/external/eigen_archive/bench/btl/data/mean.d \
./bazel-AutoML-Zero/external/eigen_archive/bench/btl/data/regularize.d \
./bazel-AutoML-Zero/external/eigen_archive/bench/btl/data/smooth.d 

OBJS += \
./bazel-AutoML-Zero/external/eigen_archive/bench/btl/data/mean.o \
./bazel-AutoML-Zero/external/eigen_archive/bench/btl/data/regularize.o \
./bazel-AutoML-Zero/external/eigen_archive/bench/btl/data/smooth.o 


# Each subdirectory must supply rules for building sources it contributes
bazel-AutoML-Zero/external/eigen_archive/bench/btl/data/%.o: ../bazel-AutoML-Zero/external/eigen_archive/bench/btl/data/%.cxx bazel-AutoML-Zero/external/eigen_archive/bench/btl/data/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C++ Compiler'
	g++ -std=c++17 -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


