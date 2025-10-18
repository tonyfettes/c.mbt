#include "moonbit.h"
#include <stdint.h>

MOONBIT_FFI_EXPORT
char
moonbit_tonyfettes_c_pointer_load_byte(void *pointer) {
  return *((char *)pointer);
}

MOONBIT_FFI_EXPORT
int16_t
moonbit_tonyfettes_c_pointer_load_int16(void *pointer) {
  return *((int16_t *)pointer);
}

MOONBIT_FFI_EXPORT
uint16_t
moonbit_tonyfettes_c_pointer_load_uint16(void *pointer) {
  return *((uint16_t *)pointer);
}

MOONBIT_FFI_EXPORT
int32_t
moonbit_tonyfettes_c_pointer_load_int(void *pointer) {
  return *((int32_t *)pointer);
}

MOONBIT_FFI_EXPORT
uint32_t
moonbit_tonyfettes_c_pointer_load_uint(void *pointer) {
  return *((uint32_t *)pointer);
}

MOONBIT_FFI_EXPORT
int64_t
moonbit_tonyfettes_c_pointer_load_int64(void *pointer) {
  return *((int64_t *)pointer);
}

MOONBIT_FFI_EXPORT
uint64_t
moonbit_tonyfettes_c_pointer_load_uint64(void *pointer) {
  return *((uint64_t *)pointer);
}

MOONBIT_FFI_EXPORT
float
moonbit_tonyfettes_c_pointer_load_float(void *pointer) {
  return *((float *)pointer);
}

MOONBIT_FFI_EXPORT
double
moonbit_tonyfettes_c_pointer_load_double(void *pointer) {
  return *((double *)pointer);
}

MOONBIT_FFI_EXPORT
void *
moonbit_tonyfettes_c_pointer_load_pointer(void **pointer) {
  return *((void **)pointer);
}
