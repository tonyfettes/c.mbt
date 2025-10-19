#include <moonbit.h>
#include <stdio.h>

MOONBIT_FFI_EXPORT
uint64_t
moonbit_tonyfettes_c_stdio_fread(
  void *ptr,
  uint64_t size,
  uint64_t n,
  FILE *stream
) {
  return fread(ptr, size, n, stream);
}
