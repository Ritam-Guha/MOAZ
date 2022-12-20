################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CPP_SRCS += \
../bazel-AutoML-Zero/external/eigen_archive/bench/btl/libs/tensors/main_linear.cpp \
../bazel-AutoML-Zero/external/eigen_archive/bench/btl/libs/tensors/main_matmat.cpp \
../bazel-AutoML-Zero/external/eigen_archive/bench/btl/libs/tensors/main_vecmat.cpp 

OBJS += \
./bazel-AutoML-Zero/external/eigen_archive/bench/btl/libs/tensors/main_linear.o \
./bazel-AutoML-Zero/external/eigen_archive/bench/btl/libs/tensors/main_matmat.o \
./bazel-AutoML-Zero/external/eigen_archive/bench/btl/libs/tensors/main_vecmat.o 

CPP_DEPS += \
./bazel-AutoML-Zero/external/eigen_archive/bench/btl/libs/tensors/main_linear.d \
./bazel-AutoML-Zero/external/eigen_archive/bench/btl/libs/tensors/main_matmat.d \
./bazel-AutoML-Zero/external/eigen_archive/bench/btl/libs/tensors/main_vecmat.d 


# Each subdirectory must supply rules for building sources it contributes
bazel-AutoML-Zero/external/eigen_archive/bench/btl/libs/tensors/%.o: ../bazel-AutoML-Zero/external/eigen_archive/bench/btl/libs/tensors/%.cpp bazel-AutoML-Zero/external/eigen_archive/bench/btl/libs/tensors/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C++ Compiler'
	g++ -std=c++17 -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


