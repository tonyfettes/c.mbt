#include <moonbit.h>
#include <stdint.h>
#include <stdlib.h>

MOONBIT_FFI_EXPORT
void *
moonbit_c_malloc(uint64_t size) {
  return malloc(size);
}
