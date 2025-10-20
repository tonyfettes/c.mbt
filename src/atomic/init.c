#include <moonbit.h>
#include <stdint.h>

#if !defined(__STDC_NO_ATOMICS__) && __STDC_VERSION__ >= 201112L

#include <stdatomic.h>

MOONBIT_FFI_EXPORT
void
moonbit_tonyfettes_c_atomic_init_int(atomic_int *object, int32_t value) {
  atomic_init(object, value);
}

#else

#include <assert.h>

MOONBIT_FFI_EXPORT
void
moonbit_tonyfettes_c_atomic_init_int(void *object, int32_t value) {
  assert(0 && "<stdatomic.h> is not available on this platform");
}

#endif
