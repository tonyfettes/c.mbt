#include <moonbit.h>
#include <stdint.h>

#ifndef __STDC_NO_ATOMICS__

#include <stdatomic.h>

MOONBIT_FFI_EXPORT
uint64_t
moonbit_tonyfettes_c_atomic_sizeof_int() {
  return sizeof(atomic_int);
}

#else

#include <assert.h>

MOONBIT_FFI_EXPORT
uint64_t
moonbit_tonyfettes_c_atomic_sizeof_int() {
  assert(0 && "<stdatomic.h> is not available on this platform");
}

#endif
