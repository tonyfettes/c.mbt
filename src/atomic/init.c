#include <moonbit.h>
#include <stdatomic.h>
#include <stdint.h>

MOONBIT_FFI_EXPORT
void
moonbit_tonyfettes_c_atomic_init_int(atomic_int *object, int32_t value) {
  atomic_init(object, value);
}
