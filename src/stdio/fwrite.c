#include <moonbit.h>
#include <stdio.h>

MOONBIT_FFI_EXPORT
uint64_t
moonbit_tonyfettes_c_stdio_fwrite(
  const void *ptr,
  uint64_t size,
  uint64_t n,
  FILE *stream
) {
  return fwrite(ptr, size, n, stream);
}
