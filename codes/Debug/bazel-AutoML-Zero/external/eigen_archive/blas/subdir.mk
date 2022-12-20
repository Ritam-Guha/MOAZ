################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CPP_SRCS += \
../bazel-AutoML-Zero/external/eigen_archive/blas/complex_double.cpp \
../bazel-AutoML-Zero/external/eigen_archive/blas/complex_single.cpp \
../bazel-AutoML-Zero/external/eigen_archive/blas/double.cpp \
../bazel-AutoML-Zero/external/eigen_archive/blas/single.cpp \
../bazel-AutoML-Zero/external/eigen_archive/blas/xerbla.cpp 

OBJS += \
./bazel-AutoML-Zero/external/eigen_archive/blas/complex_double.o \
./bazel-AutoML-Zero/external/eigen_archive/blas/complex_single.o \
./bazel-AutoML-Zero/external/eigen_archive/blas/double.o \
./bazel-AutoML-Zero/external/eigen_archive/blas/single.o \
./bazel-AutoML-Zero/external/eigen_archive/blas/xerbla.o 

CPP_DEPS += \
./bazel-AutoML-Zero/external/eigen_archive/blas/complex_double.d \
./bazel-AutoML-Zero/external/eigen_archive/blas/complex_single.d \
./bazel-AutoML-Zero/external/eigen_archive/blas/double.d \
./bazel-AutoML-Zero/external/eigen_archive/blas/single.d \
./bazel-AutoML-Zero/external/eigen_archive/blas/xerbla.d 


# Each subdirectory must supply rules for building sources it contributes
bazel-AutoML-Zero/external/eigen_archive/blas/%.o: ../bazel-AutoML-Zero/external/eigen_archive/blas/%.cpp bazel-AutoML-Zero/external/eigen_archive/blas/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C++ Compiler'
	g++ -std=c++17 -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


