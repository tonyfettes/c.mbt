#include <moonbit.h>
#include <stdint.h>
#include <stdlib.h>

MOONBIT_FFI_EXPORT
void
moonbit_tonyfettes_c_rand_srand(uint32_t seed) {
  srand(seed);
}
