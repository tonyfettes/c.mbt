#include <moonbit.h>
#include <stdatomic.h>
#include <stdint.h>

MOONBIT_FFI_EXPORT
void
moonbit_tonyfettes_c_atomic_store_explicit_int(
  atomic_int *object,
  int32_t desired,
  memory_order order
) {
  atomic_store_explicit(object, desired, order);
}
