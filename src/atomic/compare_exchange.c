#include <moonbit.h>
#include <stdint.h>

#if !defined(__STDC_NO_ATOMICS__) && __STDC_VERSION__ >= 201112L
#include <stdatomic.h>

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

#else

#include <assert.h>

MOONBIT_FFI_EXPORT
int32_t
moonbit_tonyfettes_c_atomic_compare_exchange_strong_explicit_int(
  void *object,
  int32_t *expected,
  int32_t desired,
  int32_t succ,
  int32_t fail
) {
  assert(0 && "<stdatomic.h> is not available on this platform");
}

MOONBIT_FFI_EXPORT
int32_t
moonbit_tonyfettes_c_atomic_compare_exchange_weak_explicit_int(
  void *object,
  int32_t *expected,
  int32_t desired,
  int32_t succ,
  int32_t fail
) {
  assert(0 && "<stdatomic.h> is not available on this platform");
}

#endif
