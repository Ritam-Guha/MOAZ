################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CPP_SRCS += \
../bazel-AutoML-Zero/external/eigen_archive/demos/opengl/camera.cpp \
../bazel-AutoML-Zero/external/eigen_archive/demos/opengl/gpuhelper.cpp \
../bazel-AutoML-Zero/external/eigen_archive/demos/opengl/icosphere.cpp \
../bazel-AutoML-Zero/external/eigen_archive/demos/opengl/quaternion_demo.cpp \
../bazel-AutoML-Zero/external/eigen_archive/demos/opengl/trackball.cpp 

OBJS += \
./bazel-AutoML-Zero/external/eigen_archive/demos/opengl/camera.o \
./bazel-AutoML-Zero/external/eigen_archive/demos/opengl/gpuhelper.o \
./bazel-AutoML-Zero/external/eigen_archive/demos/opengl/icosphere.o \
./bazel-AutoML-Zero/external/eigen_archive/demos/opengl/quaternion_demo.o \
./bazel-AutoML-Zero/external/eigen_archive/demos/opengl/trackball.o 

CPP_DEPS += \
./bazel-AutoML-Zero/external/eigen_archive/demos/opengl/camera.d \
./bazel-AutoML-Zero/external/eigen_archive/demos/opengl/gpuhelper.d \
./bazel-AutoML-Zero/external/eigen_archive/demos/opengl/icosphere.d \
./bazel-AutoML-Zero/external/eigen_archive/demos/opengl/quaternion_demo.d \
./bazel-AutoML-Zero/external/eigen_archive/demos/opengl/trackball.d 


# Each subdirectory must supply rules for building sources it contributes
bazel-AutoML-Zero/external/eigen_archive/demos/opengl/%.o: ../bazel-AutoML-Zero/external/eigen_archive/demos/opengl/%.cpp bazel-AutoML-Zero/external/eigen_archive/demos/opengl/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C++ Compiler'
	g++ -std=c++17 -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


