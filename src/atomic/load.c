#include <moonbit.h>
#include <stdint.h>

#ifndef __STDC_NO_ATOMICS__

#include <stdatomic.h>

MOONBIT_FFI_EXPORT
int32_t
moonbit_tonyfettes_c_atomic_load_explicit_int(
  atomic_int *object,
  memory_order order
) {
  return atomic_load_explicit(object, order);
}

#else

#include <assert.h>

MOONBIT_FFI_EXPORT
int32_t
moonbit_tonyfettes_c_atomic_load_explicit_int(void *object, int32_t order) {
  assert(0 && "<stdatomic.h> is not available on this platform");
}

#endif
