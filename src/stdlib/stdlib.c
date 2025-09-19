#include <moonbit.h>
#include <stdint.h>
#include <stdlib.h>
#include <string.h>

MOONBIT_FFI_EXPORT
void *
moonbit_c_malloc(uint64_t size) {
  return malloc(size);
}

MOONBIT_FFI_EXPORT
void
moonbit_c_memcpy(void *dest, void *src, uint64_t len) {
  memcpy(dest, src, len);
}