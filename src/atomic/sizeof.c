#include <moonbit.h>
#include <stdint.h>

#if !defined(__STDC_NO_ATOMICS__) && __STDC_VERSION__ >= 201112L

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
