#include <moonbit.h>
#include <stdatomic.h>
#include <stdint.h>

MOONBIT_FFI_EXPORT
int32_t
moonbit_tonyfettes_c_atomic_load_explicit_int(
  atomic_int *object,
  memory_order order
) {
  return atomic_load_explicit(object, order);
}
