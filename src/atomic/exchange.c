#include <moonbit.h>
#include <stdatomic.h>
#include <stdint.h>

MOONBIT_FFI_EXPORT
int32_t
moonbit_tonyfettes_c_atomic_exchange_explicit_int(
  atomic_int *object,
  int32_t desired,
  memory_order order
) {
  return atomic_exchange_explicit(object, desired, order);
}
