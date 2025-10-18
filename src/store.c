#include "moonbit.h"
#include <stdint.h>

MOONBIT_FFI_EXPORT
void
moonbit_tonyfettes_c_pointer_store_byte(void *pointer, char value) {
  *((char *)pointer) = value;
}

MOONBIT_FFI_EXPORT
void
moonbit_tonyfettes_c_pointer_store_int16(void *pointer, int16_t value) {
  *((int16_t *)pointer) = value;
}

MOONBIT_FFI_EXPORT
void
moonbit_tonyfettes_c_pointer_store_uint16(void *pointer, uint16_t value) {
  *((uint16_t *)pointer) = value;
}

MOONBIT_FFI_EXPORT
void
moonbit_tonyfettes_c_pointer_store_int(void *pointer, int32_t value) {
  *((int32_t *)pointer) = value;
}

MOONBIT_FFI_EXPORT
void
moonbit_tonyfettes_c_pointer_store_uint(void *pointer, uint32_t value) {
  *((uint32_t *)pointer) = value;
}

MOONBIT_FFI_EXPORT
void
moonbit_tonyfettes_c_pointer_store_int64(void *pointer, int64_t value) {
  *((int64_t *)pointer) = value;
}

MOONBIT_FFI_EXPORT
void
moonbit_tonyfettes_c_pointer_store_uint64(void *pointer, uint64_t value) {
  *((uint64_t *)pointer) = value;
}

MOONBIT_FFI_EXPORT
void
moonbit_tonyfettes_c_pointer_store_float(void *pointer, float value) {
  *((float *)pointer) = value;
}

MOONBIT_FFI_EXPORT
void
moonbit_tonyfettes_c_pointer_store_double(void *pointer, double value) {
  *((double *)pointer) = value;
}

MOONBIT_FFI_EXPORT
void
moonbit_tonyfettes_c_pointer_store_pointer(void **pointer, void *value) {
  *((void **)pointer) = value;
}
