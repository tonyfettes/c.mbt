#include <moonbit.h>
#include <stdatomic.h>
#include <stdint.h>

MOONBIT_FFI_EXPORT
int32_t
moonbit_tonyfettes_c_atomic_compare_exchange_strong_explicit_int(
  atomic_int *object,
  int32_t *expected,
  int32_t desired,
  memory_order succ,
  memory_order fail
) {
  return atomic_compare_exchange_strong_explicit(
    object, expected, desired, succ, fail
  );
}

MOONBIT_FFI_EXPORT
int32_t
moonbit_tonyfettes_c_atomic_compare_exchange_weak_explicit_int(
  atomic_int *object,
  int32_t *expected,
  int32_t desired,
  memory_order succ,
  memory_order fail
) {
  return atomic_compare_exchange_weak_explicit(
    object, expected, desired, succ, fail
  );
}
