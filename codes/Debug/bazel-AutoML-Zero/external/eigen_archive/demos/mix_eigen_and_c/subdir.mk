################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CPP_SRCS += \
../bazel-AutoML-Zero/external/eigen_archive/demos/mix_eigen_and_c/binary_library.cpp 

C_SRCS += \
../bazel-AutoML-Zero/external/eigen_archive/demos/mix_eigen_and_c/example.c 

OBJS += \
./bazel-AutoML-Zero/external/eigen_archive/demos/mix_eigen_and_c/binary_library.o \
./bazel-AutoML-Zero/external/eigen_archive/demos/mix_eigen_and_c/example.o 

CPP_DEPS += \
./bazel-AutoML-Zero/external/eigen_archive/demos/mix_eigen_and_c/binary_library.d 

C_DEPS += \
./bazel-AutoML-Zero/external/eigen_archive/demos/mix_eigen_and_c/example.d 


# Each subdirectory must supply rules for building sources it contributes
bazel-AutoML-Zero/external/eigen_archive/demos/mix_eigen_and_c/%.o: ../bazel-AutoML-Zero/external/eigen_archive/demos/mix_eigen_and_c/%.cpp bazel-AutoML-Zero/external/eigen_archive/demos/mix_eigen_and_c/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C++ Compiler'
	g++ -std=c++17 -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

bazel-AutoML-Zero/external/eigen_archive/demos/mix_eigen_and_c/%.o: ../bazel-AutoML-Zero/external/eigen_archive/demos/mix_eigen_and_c/%.c bazel-AutoML-Zero/external/eigen_archive/demos/mix_eigen_and_c/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C Compiler'
	gcc -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


