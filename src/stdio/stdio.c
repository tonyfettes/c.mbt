#include "moonbit.h"
#include <stdbool.h>
#include <stdint.h>
#include <stdio.h>

MOONBIT_FFI_EXPORT
int32_t
moonbit_tonyfettes_c_stdio_EOF() {
  return EOF;
}

MOONBIT_FFI_EXPORT
FILE *
moonbit_tonyfettes_c_stdio_stdin() {
  return stdin;
}

MOONBIT_FFI_EXPORT
FILE *
moonbit_tonyfettes_c_stdio_stdout() {
  return stdout;
}

MOONBIT_FFI_EXPORT
FILE *
moonbit_tonyfettes_c_stdio_stderr() {
  return stderr;
}

MOONBIT_FFI_EXPORT
bool
moonbit_c_fgets(moonbit_bytes_t data, FILE *stream) {
  return fgets((char *)data, Moonbit_array_length(data), stream) != NULL;
}

MOONBIT_FFI_EXPORT
int32_t
moonbit_c_fputs(moonbit_bytes_t data, FILE *stream) {
  return fputs((const char *)data, stream);
}
