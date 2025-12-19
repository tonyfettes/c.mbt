/*
 * Copyright 2025 International Digital Economy Academy
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#include <math.h>
#include <moonbit.h>
#include <stdint.h>

MOONBIT_FFI_EXPORT
int32_t
moonbit_tonyfettes_c_math_fp_normal(void) {
  return FP_NORMAL;
}

MOONBIT_FFI_EXPORT
int32_t
moonbit_tonyfettes_c_math_fp_subnormal(void) {
  return FP_SUBNORMAL;
}

MOONBIT_FFI_EXPORT
int32_t
moonbit_tonyfettes_c_math_fp_zero(void) {
  return FP_ZERO;
}

MOONBIT_FFI_EXPORT
int32_t
moonbit_tonyfettes_c_math_fp_infinite(void) {
  return FP_INFINITE;
}

MOONBIT_FFI_EXPORT
int32_t
moonbit_tonyfettes_c_math_fp_nan(void) {
  return FP_NAN;
}

MOONBIT_FFI_EXPORT
int32_t
moonbit_tonyfettes_c_math_fp_classify_float(float value) {
  return fpclassify(value);
}

MOONBIT_FFI_EXPORT
int32_t
moonbit_tonyfettes_c_math_fp_classify_double(double value) {
  return fpclassify(value);
}

MOONBIT_FFI_EXPORT
int32_t
moonbit_tonyfettes_c_math_fp_is_normal_float(float value) {
  return isnormal(value);
}

MOONBIT_FFI_EXPORT
int32_t
moonbit_tonyfettes_c_math_fp_is_normal_double(double value) {
  return isnormal(value);
}

MOONBIT_FFI_EXPORT
int32_t
moonbit_tonyfettes_c_math_fp_is_finite_float(float value) {
  return isfinite(value);
}

MOONBIT_FFI_EXPORT
int32_t
moonbit_tonyfettes_c_math_fp_is_finite_double(double value) {
  return isfinite(value);
}

MOONBIT_FFI_EXPORT
int32_t
moonbit_tonyfettes_c_math_fp_is_inf_float(float value) {
  return isinf(value);
}

MOONBIT_FFI_EXPORT
int32_t
moonbit_tonyfettes_c_math_fp_is_inf_double(double value) {
  return isinf(value);
}

MOONBIT_FFI_EXPORT
int32_t
moonbit_tonyfettes_c_math_fp_is_nan_float(float value) {
  return isnan(value);
}

MOONBIT_FFI_EXPORT
int32_t
moonbit_tonyfettes_c_math_fp_is_nan_double(double value) {
  return isnan(value);
}
