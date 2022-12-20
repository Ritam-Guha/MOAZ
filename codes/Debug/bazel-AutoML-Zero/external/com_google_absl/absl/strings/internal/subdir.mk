################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../bazel-AutoML-Zero/external/com_google_absl/absl/strings/internal/char_map_benchmark.cc \
../bazel-AutoML-Zero/external/com_google_absl/absl/strings/internal/char_map_test.cc \
../bazel-AutoML-Zero/external/com_google_absl/absl/strings/internal/charconv_bigint.cc \
../bazel-AutoML-Zero/external/com_google_absl/absl/strings/internal/charconv_bigint_test.cc \
../bazel-AutoML-Zero/external/com_google_absl/absl/strings/internal/charconv_parse.cc \
../bazel-AutoML-Zero/external/com_google_absl/absl/strings/internal/charconv_parse_test.cc \
../bazel-AutoML-Zero/external/com_google_absl/absl/strings/internal/cord_internal.cc \
../bazel-AutoML-Zero/external/com_google_absl/absl/strings/internal/cord_rep_ring.cc \
../bazel-AutoML-Zero/external/com_google_absl/absl/strings/internal/cordz_functions.cc \
../bazel-AutoML-Zero/external/com_google_absl/absl/strings/internal/cordz_functions_test.cc \
../bazel-AutoML-Zero/external/com_google_absl/absl/strings/internal/cordz_handle.cc \
../bazel-AutoML-Zero/external/com_google_absl/absl/strings/internal/cordz_handle_test.cc \
../bazel-AutoML-Zero/external/com_google_absl/absl/strings/internal/cordz_info.cc \
../bazel-AutoML-Zero/external/com_google_absl/absl/strings/internal/cordz_info_statistics_test.cc \
../bazel-AutoML-Zero/external/com_google_absl/absl/strings/internal/cordz_info_test.cc \
../bazel-AutoML-Zero/external/com_google_absl/absl/strings/internal/cordz_sample_token.cc \
../bazel-AutoML-Zero/external/com_google_absl/absl/strings/internal/cordz_sample_token_test.cc \
../bazel-AutoML-Zero/external/com_google_absl/absl/strings/internal/cordz_update_scope_test.cc \
../bazel-AutoML-Zero/external/com_google_absl/absl/strings/internal/cordz_update_tracker_test.cc \
../bazel-AutoML-Zero/external/com_google_absl/absl/strings/internal/escaping.cc \
../bazel-AutoML-Zero/external/com_google_absl/absl/strings/internal/memutil.cc \
../bazel-AutoML-Zero/external/com_google_absl/absl/strings/internal/memutil_benchmark.cc \
../bazel-AutoML-Zero/external/com_google_absl/absl/strings/internal/memutil_test.cc \
../bazel-AutoML-Zero/external/com_google_absl/absl/strings/internal/ostringstream.cc \
../bazel-AutoML-Zero/external/com_google_absl/absl/strings/internal/ostringstream_benchmark.cc \
../bazel-AutoML-Zero/external/com_google_absl/absl/strings/internal/ostringstream_test.cc \
../bazel-AutoML-Zero/external/com_google_absl/absl/strings/internal/pow10_helper.cc \
../bazel-AutoML-Zero/external/com_google_absl/absl/strings/internal/pow10_helper_test.cc \
../bazel-AutoML-Zero/external/com_google_absl/absl/strings/internal/resize_uninitialized_test.cc \
../bazel-AutoML-Zero/external/com_google_absl/absl/strings/internal/string_constant_test.cc \
../bazel-AutoML-Zero/external/com_google_absl/absl/strings/internal/utf8.cc \
../bazel-AutoML-Zero/external/com_google_absl/absl/strings/internal/utf8_test.cc 

CC_DEPS += \
./bazel-AutoML-Zero/external/com_google_absl/absl/strings/internal/char_map_benchmark.d \
./bazel-AutoML-Zero/external/com_google_absl/absl/strings/internal/char_map_test.d \
./bazel-AutoML-Zero/external/com_google_absl/absl/strings/internal/charconv_bigint.d \
./bazel-AutoML-Zero/external/com_google_absl/absl/strings/internal/charconv_bigint_test.d \
./bazel-AutoML-Zero/external/com_google_absl/absl/strings/internal/charconv_parse.d \
./bazel-AutoML-Zero/external/com_google_absl/absl/strings/internal/charconv_parse_test.d \
./bazel-AutoML-Zero/external/com_google_absl/absl/strings/internal/cord_internal.d \
./bazel-AutoML-Zero/external/com_google_absl/absl/strings/internal/cord_rep_ring.d \
./bazel-AutoML-Zero/external/com_google_absl/absl/strings/internal/cordz_functions.d \
./bazel-AutoML-Zero/external/com_google_absl/absl/strings/internal/cordz_functions_test.d \
./bazel-AutoML-Zero/external/com_google_absl/absl/strings/internal/cordz_handle.d \
./bazel-AutoML-Zero/external/com_google_absl/absl/strings/internal/cordz_handle_test.d \
./bazel-AutoML-Zero/external/com_google_absl/absl/strings/internal/cordz_info.d \
./bazel-AutoML-Zero/external/com_google_absl/absl/strings/internal/cordz_info_statistics_test.d \
./bazel-AutoML-Zero/external/com_google_absl/absl/strings/internal/cordz_info_test.d \
./bazel-AutoML-Zero/external/com_google_absl/absl/strings/internal/cordz_sample_token.d \
./bazel-AutoML-Zero/external/com_google_absl/absl/strings/internal/cordz_sample_token_test.d \
./bazel-AutoML-Zero/external/com_google_absl/absl/strings/internal/cordz_update_scope_test.d \
./bazel-AutoML-Zero/external/com_google_absl/absl/strings/internal/cordz_update_tracker_test.d \
./bazel-AutoML-Zero/external/com_google_absl/absl/strings/internal/escaping.d \
./bazel-AutoML-Zero/external/com_google_absl/absl/strings/internal/memutil.d \
./bazel-AutoML-Zero/external/com_google_absl/absl/strings/internal/memutil_benchmark.d \
./bazel-AutoML-Zero/external/com_google_absl/absl/strings/internal/memutil_test.d \
./bazel-AutoML-Zero/external/com_google_absl/absl/strings/internal/ostringstream.d \
./bazel-AutoML-Zero/external/com_google_absl/absl/strings/internal/ostringstream_benchmark.d \
./bazel-AutoML-Zero/external/com_google_absl/absl/strings/internal/ostringstream_test.d \
./bazel-AutoML-Zero/external/com_google_absl/absl/strings/internal/pow10_helper.d \
./bazel-AutoML-Zero/external/com_google_absl/absl/strings/internal/pow10_helper_test.d \
./bazel-AutoML-Zero/external/com_google_absl/absl/strings/internal/resize_uninitialized_test.d \
./bazel-AutoML-Zero/external/com_google_absl/absl/strings/internal/string_constant_test.d \
./bazel-AutoML-Zero/external/com_google_absl/absl/strings/internal/utf8.d \
./bazel-AutoML-Zero/external/com_google_absl/absl/strings/internal/utf8_test.d 

OBJS += \
./bazel-AutoML-Zero/external/com_google_absl/absl/strings/internal/char_map_benchmark.o \
./bazel-AutoML-Zero/external/com_google_absl/absl/strings/internal/char_map_test.o \
./bazel-AutoML-Zero/external/com_google_absl/absl/strings/internal/charconv_bigint.o \
./bazel-AutoML-Zero/external/com_google_absl/absl/strings/internal/charconv_bigint_test.o \
./bazel-AutoML-Zero/external/com_google_absl/absl/strings/internal/charconv_parse.o \
./bazel-AutoML-Zero/external/com_google_absl/absl/strings/internal/charconv_parse_test.o \
./bazel-AutoML-Zero/external/com_google_absl/absl/strings/internal/cord_internal.o \
./bazel-AutoML-Zero/external/com_google_absl/absl/strings/internal/cord_rep_ring.o \
./bazel-AutoML-Zero/external/com_google_absl/absl/strings/internal/cordz_functions.o \
./bazel-AutoML-Zero/external/com_google_absl/absl/strings/internal/cordz_functions_test.o \
./bazel-AutoML-Zero/external/com_google_absl/absl/strings/internal/cordz_handle.o \
./bazel-AutoML-Zero/external/com_google_absl/absl/strings/internal/cordz_handle_test.o \
./bazel-AutoML-Zero/external/com_google_absl/absl/strings/internal/cordz_info.o \
./bazel-AutoML-Zero/external/com_google_absl/absl/strings/internal/cordz_info_statistics_test.o \
./bazel-AutoML-Zero/external/com_google_absl/absl/strings/internal/cordz_info_test.o \
./bazel-AutoML-Zero/external/com_google_absl/absl/strings/internal/cordz_sample_token.o \
./bazel-AutoML-Zero/external/com_google_absl/absl/strings/internal/cordz_sample_token_test.o \
./bazel-AutoML-Zero/external/com_google_absl/absl/strings/internal/cordz_update_scope_test.o \
./bazel-AutoML-Zero/external/com_google_absl/absl/strings/internal/cordz_update_tracker_test.o \
./bazel-AutoML-Zero/external/com_google_absl/absl/strings/internal/escaping.o \
./bazel-AutoML-Zero/external/com_google_absl/absl/strings/internal/memutil.o \
./bazel-AutoML-Zero/external/com_google_absl/absl/strings/internal/memutil_benchmark.o \
./bazel-AutoML-Zero/external/com_google_absl/absl/strings/internal/memutil_test.o \
./bazel-AutoML-Zero/external/com_google_absl/absl/strings/internal/ostringstream.o \
./bazel-AutoML-Zero/external/com_google_absl/absl/strings/internal/ostringstream_benchmark.o \
./bazel-AutoML-Zero/external/com_google_absl/absl/strings/internal/ostringstream_test.o \
./bazel-AutoML-Zero/external/com_google_absl/absl/strings/internal/pow10_helper.o \
./bazel-AutoML-Zero/external/com_google_absl/absl/strings/internal/pow10_helper_test.o \
./bazel-AutoML-Zero/external/com_google_absl/absl/strings/internal/resize_uninitialized_test.o \
./bazel-AutoML-Zero/external/com_google_absl/absl/strings/internal/string_constant_test.o \
./bazel-AutoML-Zero/external/com_google_absl/absl/strings/internal/utf8.o \
./bazel-AutoML-Zero/external/com_google_absl/absl/strings/internal/utf8_test.o 


# Each subdirectory must supply rules for building sources it contributes
bazel-AutoML-Zero/external/com_google_absl/absl/strings/internal/%.o: ../bazel-AutoML-Zero/external/com_google_absl/absl/strings/internal/%.cc bazel-AutoML-Zero/external/com_google_absl/absl/strings/internal/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C++ Compiler'
	g++ -std=c++17 -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


