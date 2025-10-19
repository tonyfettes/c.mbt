#include <errno.h>
#include <moonbit.h>
#include <stdint.h>

MOONBIT_FFI_EXPORT
int32_t
moonbit_tonyfettes_c_errno_get() {
  return errno;
}

MOONBIT_FFI_EXPORT
int32_t
moonbit_tonyfettes_c_errno_set(int32_t value) {
  errno = value;
  return errno;
}

MOONBIT_FFI_EXPORT
int32_t
moonbit_tonyfettes_c_errno_edom() {
  return EDOM;
}

MOONBIT_FFI_EXPORT
int32_t
moonbit_tonyfettes_c_errno_erange() {
  return ERANGE;
}
