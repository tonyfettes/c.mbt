#include "moonbit.h"
#include <stdint.h>

MOONBIT_FFI_EXPORT
void *
moonbit_ffi_make_closure(void *function, void *callback) {
  return callback;
}
