#include <assert.h>
#include <moonbit.h>

#ifndef __STDC_NO_THREADS__
#include <threads.h>

MOONBIT_FFI_EXPORT
int32_t
moonbit_tonyfettes_c_thrd_create(
  thrd_t *thread,
  int32_t (*func)(void *),
  void *arg
) {
  return thrd_create(thread, func, arg);
}

#else

MOONBIT_FFI_EXPORT
int32_t
moonbit_tonyfettes_c_thrd_create(
  void *thread,
  int32_t (*func)(void *),
  void *arg
) {
  assert(0 && "<threads.h> is not available on this platform");
}

#endif
