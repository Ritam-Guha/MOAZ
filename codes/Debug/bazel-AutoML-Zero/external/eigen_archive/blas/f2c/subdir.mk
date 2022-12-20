################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../bazel-AutoML-Zero/external/eigen_archive/blas/f2c/chbmv.c \
../bazel-AutoML-Zero/external/eigen_archive/blas/f2c/chpmv.c \
../bazel-AutoML-Zero/external/eigen_archive/blas/f2c/complexdots.c \
../bazel-AutoML-Zero/external/eigen_archive/blas/f2c/ctbmv.c \
../bazel-AutoML-Zero/external/eigen_archive/blas/f2c/d_cnjg.c \
../bazel-AutoML-Zero/external/eigen_archive/blas/f2c/drotm.c \
../bazel-AutoML-Zero/external/eigen_archive/blas/f2c/drotmg.c \
../bazel-AutoML-Zero/external/eigen_archive/blas/f2c/dsbmv.c \
../bazel-AutoML-Zero/external/eigen_archive/blas/f2c/dspmv.c \
../bazel-AutoML-Zero/external/eigen_archive/blas/f2c/dtbmv.c \
../bazel-AutoML-Zero/external/eigen_archive/blas/f2c/lsame.c \
../bazel-AutoML-Zero/external/eigen_archive/blas/f2c/r_cnjg.c \
../bazel-AutoML-Zero/external/eigen_archive/blas/f2c/srotm.c \
../bazel-AutoML-Zero/external/eigen_archive/blas/f2c/srotmg.c \
../bazel-AutoML-Zero/external/eigen_archive/blas/f2c/ssbmv.c \
../bazel-AutoML-Zero/external/eigen_archive/blas/f2c/sspmv.c \
../bazel-AutoML-Zero/external/eigen_archive/blas/f2c/stbmv.c \
../bazel-AutoML-Zero/external/eigen_archive/blas/f2c/zhbmv.c \
../bazel-AutoML-Zero/external/eigen_archive/blas/f2c/zhpmv.c \
../bazel-AutoML-Zero/external/eigen_archive/blas/f2c/ztbmv.c 

OBJS += \
./bazel-AutoML-Zero/external/eigen_archive/blas/f2c/chbmv.o \
./bazel-AutoML-Zero/external/eigen_archive/blas/f2c/chpmv.o \
./bazel-AutoML-Zero/external/eigen_archive/blas/f2c/complexdots.o \
./bazel-AutoML-Zero/external/eigen_archive/blas/f2c/ctbmv.o \
./bazel-AutoML-Zero/external/eigen_archive/blas/f2c/d_cnjg.o \
./bazel-AutoML-Zero/external/eigen_archive/blas/f2c/drotm.o \
./bazel-AutoML-Zero/external/eigen_archive/blas/f2c/drotmg.o \
./bazel-AutoML-Zero/external/eigen_archive/blas/f2c/dsbmv.o \
./bazel-AutoML-Zero/external/eigen_archive/blas/f2c/dspmv.o \
./bazel-AutoML-Zero/external/eigen_archive/blas/f2c/dtbmv.o \
./bazel-AutoML-Zero/external/eigen_archive/blas/f2c/lsame.o \
./bazel-AutoML-Zero/external/eigen_archive/blas/f2c/r_cnjg.o \
./bazel-AutoML-Zero/external/eigen_archive/blas/f2c/srotm.o \
./bazel-AutoML-Zero/external/eigen_archive/blas/f2c/srotmg.o \
./bazel-AutoML-Zero/external/eigen_archive/blas/f2c/ssbmv.o \
./bazel-AutoML-Zero/external/eigen_archive/blas/f2c/sspmv.o \
./bazel-AutoML-Zero/external/eigen_archive/blas/f2c/stbmv.o \
./bazel-AutoML-Zero/external/eigen_archive/blas/f2c/zhbmv.o \
./bazel-AutoML-Zero/external/eigen_archive/blas/f2c/zhpmv.o \
./bazel-AutoML-Zero/external/eigen_archive/blas/f2c/ztbmv.o 

C_DEPS += \
./bazel-AutoML-Zero/external/eigen_archive/blas/f2c/chbmv.d \
./bazel-AutoML-Zero/external/eigen_archive/blas/f2c/chpmv.d \
./bazel-AutoML-Zero/external/eigen_archive/blas/f2c/complexdots.d \
./bazel-AutoML-Zero/external/eigen_archive/blas/f2c/ctbmv.d \
./bazel-AutoML-Zero/external/eigen_archive/blas/f2c/d_cnjg.d \
./bazel-AutoML-Zero/external/eigen_archive/blas/f2c/drotm.d \
./bazel-AutoML-Zero/external/eigen_archive/blas/f2c/drotmg.d \
./bazel-AutoML-Zero/external/eigen_archive/blas/f2c/dsbmv.d \
./bazel-AutoML-Zero/external/eigen_archive/blas/f2c/dspmv.d \
./bazel-AutoML-Zero/external/eigen_archive/blas/f2c/dtbmv.d \
./bazel-AutoML-Zero/external/eigen_archive/blas/f2c/lsame.d \
./bazel-AutoML-Zero/external/eigen_archive/blas/f2c/r_cnjg.d \
./bazel-AutoML-Zero/external/eigen_archive/blas/f2c/srotm.d \
./bazel-AutoML-Zero/external/eigen_archive/blas/f2c/srotmg.d \
./bazel-AutoML-Zero/external/eigen_archive/blas/f2c/ssbmv.d \
./bazel-AutoML-Zero/external/eigen_archive/blas/f2c/sspmv.d \
./bazel-AutoML-Zero/external/eigen_archive/blas/f2c/stbmv.d \
./bazel-AutoML-Zero/external/eigen_archive/blas/f2c/zhbmv.d \
./bazel-AutoML-Zero/external/eigen_archive/blas/f2c/zhpmv.d \
./bazel-AutoML-Zero/external/eigen_archive/blas/f2c/ztbmv.d 


# Each subdirectory must supply rules for building sources it contributes
bazel-AutoML-Zero/external/eigen_archive/blas/f2c/%.o: ../bazel-AutoML-Zero/external/eigen_archive/blas/f2c/%.c bazel-AutoML-Zero/external/eigen_archive/blas/f2c/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C Compiler'
	gcc -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


