#include <moonbit.h>
#include <stdlib.h>

MOONBIT_FFI_EXPORT
void
moonbit_tonyfettes_c_memory_free(void *ptr) {
  free(ptr);
}
