#include <moonbit.h>
#include <stdbool.h>
#include <stdlib.h>

void *
moonbit_ffi_make_closure(void *function, void *callback) {
  return callback;
}

void *
moonbit_c_null() {
  return NULL;
}

int
moonbit_c_is_null(void *ptr) {
  return ptr == NULL;
}

bool
moonbit_c_pointer_equal(void *ptr1, void *ptr2) {
  return ptr1 == ptr2;
}

void *
moonbit_c_malloc(uint64_t size) {
  return malloc(size);
}
