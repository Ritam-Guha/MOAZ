################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CPP_SRCS += \
../bazel-AutoML-Zero/external/eigen_archive/bench/btl/libs/eigen3/btl_tiny_eigen3.cpp \
../bazel-AutoML-Zero/external/eigen_archive/bench/btl/libs/eigen3/main_adv.cpp \
../bazel-AutoML-Zero/external/eigen_archive/bench/btl/libs/eigen3/main_linear.cpp \
../bazel-AutoML-Zero/external/eigen_archive/bench/btl/libs/eigen3/main_matmat.cpp \
../bazel-AutoML-Zero/external/eigen_archive/bench/btl/libs/eigen3/main_vecmat.cpp 

OBJS += \
./bazel-AutoML-Zero/external/eigen_archive/bench/btl/libs/eigen3/btl_tiny_eigen3.o \
./bazel-AutoML-Zero/external/eigen_archive/bench/btl/libs/eigen3/main_adv.o \
./bazel-AutoML-Zero/external/eigen_archive/bench/btl/libs/eigen3/main_linear.o \
./bazel-AutoML-Zero/external/eigen_archive/bench/btl/libs/eigen3/main_matmat.o \
./bazel-AutoML-Zero/external/eigen_archive/bench/btl/libs/eigen3/main_vecmat.o 

CPP_DEPS += \
./bazel-AutoML-Zero/external/eigen_archive/bench/btl/libs/eigen3/btl_tiny_eigen3.d \
./bazel-AutoML-Zero/external/eigen_archive/bench/btl/libs/eigen3/main_adv.d \
./bazel-AutoML-Zero/external/eigen_archive/bench/btl/libs/eigen3/main_linear.d \
./bazel-AutoML-Zero/external/eigen_archive/bench/btl/libs/eigen3/main_matmat.d \
./bazel-AutoML-Zero/external/eigen_archive/bench/btl/libs/eigen3/main_vecmat.d 


# Each subdirectory must supply rules for building sources it contributes
bazel-AutoML-Zero/external/eigen_archive/bench/btl/libs/eigen3/%.o: ../bazel-AutoML-Zero/external/eigen_archive/bench/btl/libs/eigen3/%.cpp bazel-AutoML-Zero/external/eigen_archive/bench/btl/libs/eigen3/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C++ Compiler'
	g++ -std=c++17 -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


