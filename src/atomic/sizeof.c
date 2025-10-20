
#include <moonbit.h>
#include <stdatomic.h>
#include <stdint.h>

MOONBIT_FFI_EXPORT
uint64_t
moonbit_tonyfettes_c_atomic_sizeof_int() {
  return sizeof(atomic_int);
}
