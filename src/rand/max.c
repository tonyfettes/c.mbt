#include <moonbit.h>
#include <stdint.h>
#include <stdlib.h>

MOONBIT_FFI_EXPORT
int32_t
moonbit_tonyfettes_c_rand_max(void) {
  return RAND_MAX;
}
