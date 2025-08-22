#include "moonbit.h"
#include <stdint.h>
#include <stdio.h>

MOONBIT_FFI_EXPORT
FILE *
moonbit_c_stdio_stdin() {
  return stdin;
}
