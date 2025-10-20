#include <assert.h>
#include <moonbit.h>

#ifndef __STDC_NO_THREADS__
#include <threads.h>

MOONBIT_FFI_EXPORT
uint64_t
moonbit_tonyfettes_c_sizeof_thrd(void) {
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

#else

#include <assert.h>

MOONBIT_FFI_EXPORT
uint64_t
moonbit_tonyfettes_c_sizeof_thrd(void) {
  assert(0 && "<threads.h> is not available on this platform");
}

MOONBIT_FFI_EXPORT
int32_t
moonbit_tonyfettes_c_thrd_success(void) {
  assert(0 && "<threads.h> is not available on this platform");
}

MOONBIT_FFI_EXPORT
int32_t
moonbit_tonyfettes_c_thrd_nomem(void) {
  assert(0 && "<threads.h> is not available on this platform");
}

MOONBIT_FFI_EXPORT
int32_t
moonbit_tonyfettes_c_thrd_timedout(void) {
  assert(0 && "<threads.h> is not available on this platform");
}

MOONBIT_FFI_EXPORT
int32_t
moonbit_tonyfettes_c_thrd_busy(void) {
  assert(0 && "<threads.h> is not available on this platform");
}

MOONBIT_FFI_EXPORT
int32_t
moonbit_tonyfettes_c_thrd_error(void) {
  assert(0 && "<threads.h> is not available on this platform");
}

#endif
