################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CPP_SRCS += \
../bazel-AutoML-Zero/external/eigen_archive/unsupported/doc/examples/BVH_Example.cpp \
../bazel-AutoML-Zero/external/eigen_archive/unsupported/doc/examples/EulerAngles.cpp \
../bazel-AutoML-Zero/external/eigen_archive/unsupported/doc/examples/FFT.cpp \
../bazel-AutoML-Zero/external/eigen_archive/unsupported/doc/examples/MatrixExponential.cpp \
../bazel-AutoML-Zero/external/eigen_archive/unsupported/doc/examples/MatrixFunction.cpp \
../bazel-AutoML-Zero/external/eigen_archive/unsupported/doc/examples/MatrixLogarithm.cpp \
../bazel-AutoML-Zero/external/eigen_archive/unsupported/doc/examples/MatrixPower.cpp \
../bazel-AutoML-Zero/external/eigen_archive/unsupported/doc/examples/MatrixPower_optimal.cpp \
../bazel-AutoML-Zero/external/eigen_archive/unsupported/doc/examples/MatrixSine.cpp \
../bazel-AutoML-Zero/external/eigen_archive/unsupported/doc/examples/MatrixSinh.cpp \
../bazel-AutoML-Zero/external/eigen_archive/unsupported/doc/examples/MatrixSquareRoot.cpp \
../bazel-AutoML-Zero/external/eigen_archive/unsupported/doc/examples/PolynomialSolver1.cpp \
../bazel-AutoML-Zero/external/eigen_archive/unsupported/doc/examples/PolynomialUtils1.cpp 

OBJS += \
./bazel-AutoML-Zero/external/eigen_archive/unsupported/doc/examples/BVH_Example.o \
./bazel-AutoML-Zero/external/eigen_archive/unsupported/doc/examples/EulerAngles.o \
./bazel-AutoML-Zero/external/eigen_archive/unsupported/doc/examples/FFT.o \
./bazel-AutoML-Zero/external/eigen_archive/unsupported/doc/examples/MatrixExponential.o \
./bazel-AutoML-Zero/external/eigen_archive/unsupported/doc/examples/MatrixFunction.o \
./bazel-AutoML-Zero/external/eigen_archive/unsupported/doc/examples/MatrixLogarithm.o \
./bazel-AutoML-Zero/external/eigen_archive/unsupported/doc/examples/MatrixPower.o \
./bazel-AutoML-Zero/external/eigen_archive/unsupported/doc/examples/MatrixPower_optimal.o \
./bazel-AutoML-Zero/external/eigen_archive/unsupported/doc/examples/MatrixSine.o \
./bazel-AutoML-Zero/external/eigen_archive/unsupported/doc/examples/MatrixSinh.o \
./bazel-AutoML-Zero/external/eigen_archive/unsupported/doc/examples/MatrixSquareRoot.o \
./bazel-AutoML-Zero/external/eigen_archive/unsupported/doc/examples/PolynomialSolver1.o \
./bazel-AutoML-Zero/external/eigen_archive/unsupported/doc/examples/PolynomialUtils1.o 

CPP_DEPS += \
./bazel-AutoML-Zero/external/eigen_archive/unsupported/doc/examples/BVH_Example.d \
./bazel-AutoML-Zero/external/eigen_archive/unsupported/doc/examples/EulerAngles.d \
./bazel-AutoML-Zero/external/eigen_archive/unsupported/doc/examples/FFT.d \
./bazel-AutoML-Zero/external/eigen_archive/unsupported/doc/examples/MatrixExponential.d \
./bazel-AutoML-Zero/external/eigen_archive/unsupported/doc/examples/MatrixFunction.d \
./bazel-AutoML-Zero/external/eigen_archive/unsupported/doc/examples/MatrixLogarithm.d \
./bazel-AutoML-Zero/external/eigen_archive/unsupported/doc/examples/MatrixPower.d \
./bazel-AutoML-Zero/external/eigen_archive/unsupported/doc/examples/MatrixPower_optimal.d \
./bazel-AutoML-Zero/external/eigen_archive/unsupported/doc/examples/MatrixSine.d \
./bazel-AutoML-Zero/external/eigen_archive/unsupported/doc/examples/MatrixSinh.d \
./bazel-AutoML-Zero/external/eigen_archive/unsupported/doc/examples/MatrixSquareRoot.d \
./bazel-AutoML-Zero/external/eigen_archive/unsupported/doc/examples/PolynomialSolver1.d \
./bazel-AutoML-Zero/external/eigen_archive/unsupported/doc/examples/PolynomialUtils1.d 


# Each subdirectory must supply rules for building sources it contributes
bazel-AutoML-Zero/external/eigen_archive/unsupported/doc/examples/%.o: ../bazel-AutoML-Zero/external/eigen_archive/unsupported/doc/examples/%.cpp bazel-AutoML-Zero/external/eigen_archive/unsupported/doc/examples/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C++ Compiler'
	g++ -std=c++17 -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


