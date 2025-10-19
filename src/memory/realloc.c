#include <moonbit.h>
#include <stdlib.h>

MOONBIT_FFI_EXPORT
void *
moonbit_tonyfettes_c_memory_realloc(void *ptr, uint64_t size) {
  return realloc(ptr, size);
}
