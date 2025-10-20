#include <moonbit.h>
#include <stdatomic.h>
#include <stdint.h>

MOONBIT_FFI_EXPORT
int32_t
moonbit_tonyfettes_c_atomic_fetch_add_explicit_int(
  atomic_int *object,
  int32_t operand,
  memory_order order
) {
  return atomic_fetch_add_explicit(object, operand, order);
}
