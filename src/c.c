#include <moonbit.h>
#include <stdbool.h>
#include <stdint.h>
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

char
moonbit_c_load_char(char *ptr) {
  return *ptr;
}
int
moonbit_c_load_int(int *ptr) {
  return *ptr;
}
float
moonbit_c_load_float(float *ptr) {
  return *ptr;
}
double
moonbit_c_load_double(double *ptr) {
  return *ptr;
}
void
moonbit_c_store_char(char *ptr, char val) {
  *ptr = val;
}
void
moonbit_c_store_int(int *ptr, int val) {
  *ptr = val;
}
void
moonbit_c_store_float(float *ptr, float val) {
  *ptr = val;
}
void
moonbit_c_store_double(double *ptr, double val) {
  *ptr = val;
}
uint64_t
moonbit_c_ptr_to_uint64(void *ptr) {
  return (uint64_t)ptr;
}
void *
moonbit_c_ptr_of_uint64(uint64_t ptr) {
  return (void *)ptr;
}
bool
moonbit_c_pointer_equal(void *ptr1, void *ptr2) {
  return ptr1 == ptr2;
}
