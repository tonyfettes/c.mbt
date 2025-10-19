#include <moonbit.h>
#include <stdlib.h>

MOONBIT_FFI_EXPORT
void *
moonbit_tonyfettes_c_memory_calloc(uint64_t n, uint64_t size) {
  return calloc(n, size);
}
