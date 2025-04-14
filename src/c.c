#include "moonbit.h"
#include <stdlib.h>

MOONBIT_FFI_EXPORT
void *
moonbit_ffi_make_closure(void *function, void *callback) {
  return callback;
}

MOONBIT_FFI_EXPORT
void *
moonbit_c_null() {
  return NULL;
}

MOONBIT_FFI_EXPORT
int
moonbit_c_is_null(void *ptr) {
  return ptr == NULL;
}

MOONBIT_FFI_EXPORT
int
moonbit_c_pointer_equal(void *ptr1, void *ptr2) {
  return ptr1 == ptr2;
}

MOONBIT_FFI_EXPORT
void *
moonbit_c_identity(void *pointer) {
  return pointer;
}
