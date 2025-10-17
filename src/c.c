#include "moonbit.h"
#include <stdint.h>

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
int32_t
moonbit_c_is_null(void *ptr) {
  return ptr == NULL;
}

MOONBIT_FFI_EXPORT
int32_t
moonbit_c_not_null(void *ptr) {
  return ptr != NULL;
}

MOONBIT_FFI_EXPORT
int32_t
moonbit_c_pointer_equal(void *ptr1, void *ptr2) {
  return ptr1 == ptr2;
}

MOONBIT_FFI_EXPORT
int64_t
moonbit_c_pointer_compare(uint8_t *ptr1, uint8_t *ptr2) {
  return (int64_t)(ptr1 - ptr2);
}

MOONBIT_FFI_EXPORT
uint8_t *
moonbit_c_pointer_add(uint8_t *pointer, uint64_t offset) {
  return pointer + offset;
}

MOONBIT_FFI_EXPORT
uint64_t
moonbit_c_pointer_sub(uint8_t *upper, uint8_t *lower) {
  return (uint64_t)(upper - lower);
}

MOONBIT_FFI_EXPORT
uint64_t
moonbit_c_sizeof_pointer() {
  return sizeof(void *);
}

MOONBIT_FFI_EXPORT
void *
moonbit_c_identity(void *pointer) {
  return pointer;
}

MOONBIT_FFI_EXPORT
char
moonbit_c_load_byte(void *pointer) {
  return *((char *)pointer);
}

MOONBIT_FFI_EXPORT
int16_t
moonbit_c_load_int16(void *pointer) {
  return *((int16_t *)pointer);
}

MOONBIT_FFI_EXPORT
uint16_t
moonbit_c_load_uint16(void *pointer) {
  return *((uint16_t *)pointer);
}

MOONBIT_FFI_EXPORT
int32_t
moonbit_c_load_int(void *pointer) {
  return *((int32_t *)pointer);
}

MOONBIT_FFI_EXPORT
uint32_t
moonbit_c_load_uint(void *pointer) {
  return *((uint32_t *)pointer);
}

MOONBIT_FFI_EXPORT
int64_t
moonbit_c_load_int64(void *pointer) {
  return *((int64_t *)pointer);
}

MOONBIT_FFI_EXPORT
uint64_t
moonbit_c_load_uint64(void *pointer) {
  return *((uint64_t *)pointer);
}

MOONBIT_FFI_EXPORT
float
moonbit_c_load_float(void *pointer) {
  return *((float *)pointer);
}

MOONBIT_FFI_EXPORT
double
moonbit_c_load_double(void *pointer) {
  return *((double *)pointer);
}

MOONBIT_FFI_EXPORT
void
moonbit_c_store_byte(void *pointer, char value) {
  *((char *)pointer) = value;
}

MOONBIT_FFI_EXPORT
void
moonbit_c_store_int16(void *pointer, int16_t value) {
  *((int16_t *)pointer) = value;
}

MOONBIT_FFI_EXPORT
void
moonbit_c_store_uint16(void *pointer, uint16_t value) {
  *((uint16_t *)pointer) = value;
}

MOONBIT_FFI_EXPORT
void
moonbit_c_store_int(void *pointer, int32_t value) {
  *((int32_t *)pointer) = value;
}

MOONBIT_FFI_EXPORT
void
moonbit_c_store_uint(void *pointer, uint32_t value) {
  *((uint32_t *)pointer) = value;
}

MOONBIT_FFI_EXPORT
void
moonbit_c_store_int64(void *pointer, int64_t value) {
  *((int64_t *)pointer) = value;
}

MOONBIT_FFI_EXPORT
void
moonbit_c_store_uint64(void *pointer, uint64_t value) {
  *((uint64_t *)pointer) = value;
}

MOONBIT_FFI_EXPORT
void
moonbit_c_store_float(void *pointer, float value) {
  *((float *)pointer) = value;
}

MOONBIT_FFI_EXPORT
void
moonbit_c_store_double(void *pointer, double value) {
  *((double *)pointer) = value;
}
