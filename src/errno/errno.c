#include <errno.h>
#include <moonbit.h>
#include <stdint.h>

MOONBIT_FFI_EXPORT
int32_t
moonbit_c_errno_get() {
  return errno;
}

MOONBIT_FFI_EXPORT
int32_t
moonbit_c_errno_set(int32_t value) {
  errno = value;
  return errno;
}
