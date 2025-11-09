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
