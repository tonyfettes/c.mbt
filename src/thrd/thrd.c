#include <moonbit.h>
#include <threads.h>

MOONBIT_FFI_EXPORT
uint64_t
moonbit_tonyfettes_c_sizeof_thrd_t(void) {
  return sizeof(thrd_t);
}

MOONBIT_FFI_EXPORT
int32_t
moonbit_tonyfettes_c_thrd_success(void) {
  return thrd_success;
}

MOONBIT_FFI_EXPORT
int32_t
moonbit_tonyfettes_c_thrd_nomem(void) {
  return thrd_nomem;
}

MOONBIT_FFI_EXPORT
int32_t
moonbit_tonyfettes_c_thrd_timedout(void) {
  return thrd_timedout;
}

MOONBIT_FFI_EXPORT
int32_t
moonbit_tonyfettes_c_thrd_busy(void) {
  return thrd_busy;
}

MOONBIT_FFI_EXPORT
int32_t
moonbit_tonyfettes_c_thrd_error(void) {
  return thrd_error;
}
