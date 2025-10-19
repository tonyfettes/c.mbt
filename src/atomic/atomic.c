#include <moonbit.h>
#include <stdatomic.h>
#include <stdint.h>

MOONBIT_FFI_EXPORT
uint64_t
moonbit_tonyfettes_c_atomic_sizeof_int() {
  return sizeof(atomic_int);
}

MOONBIT_FFI_EXPORT
void
moonbit_tonyfettes_c_atomic_init_int(atomic_int *object, int32_t value) {
  atomic_init(object, value);
}

MOONBIT_FFI_EXPORT
int32_t
moonbit_tonyfettes_c_atomic_load_explicit_int(
  atomic_int *object,
  memory_order order
) {
  return atomic_load_explicit(object, order);
}

MOONBIT_FFI_EXPORT
void
moonbit_tonyfettes_c_atomic_store_explicit_int(
  atomic_int *object,
  int32_t desired,
  memory_order order
) {
  atomic_store_explicit(object, desired, order);
}

MOONBIT_FFI_EXPORT
int32_t
moonbit_tonyfettes_c_atomic_fetch_add_explicit_int(
  atomic_int *object,
  int32_t operand,
  memory_order order
) {
  return atomic_fetch_add_explicit(object, operand, order);
}
