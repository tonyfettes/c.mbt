#include <assert.h>
#include <moonbit.h>

#if !defined(__STDC_NO_THREADS__) && __STDC_VERSION__ >= 201112L

#include <threads.h>

MOONBIT_FFI_EXPORT
int32_t
moonbit_tonyfettes_c_thrd_join(thrd_t *thread, int32_t *res) {
  return thrd_join(*thread, res);
}

#else

#include <assert.h>

MOONBIT_FFI_EXPORT
int32_t
moonbit_tonyfettes_c_thrd_join(void *thread, int32_t *res) {
  assert(0 && "<threads.h> is not available on this platform");
}

#endif
