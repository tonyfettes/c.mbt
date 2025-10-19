#include <moonbit.h>
#include <stdio.h>

MOONBIT_FFI_EXPORT
void *
moonbit_tonyfettes_c_stdio_fopen(const char *filename, const char *mode) {
  return (void *)fopen(filename, mode);
}
