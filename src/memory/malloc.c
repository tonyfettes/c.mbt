#include <moonbit.h>
#include <stdlib.h>

MOONBIT_FFI_EXPORT
void *
moonbit_tonyfettes_c_memory_malloc(uint64_t size) {
  return malloc(size);
}
