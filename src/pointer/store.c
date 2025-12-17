/*
 * Copyright 2025 International Digital Economy Academy
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#include "moonbit.h"
#include <stdbool.h>
#include <stdint.h>

MOONBIT_FFI_EXPORT
void
moonbit_tonyfettes_c_pointer_store_bool(void *pointer, int32_t value) {
  *((bool *)pointer) = value;
}

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

MOONBIT_FFI_EXPORT
void
moonbit_tonyfettes_c_pointer_store_ptrdiff(void *pointer, ptrdiff_t value) {
  *((ptrdiff_t *)pointer) = value;
}

MOONBIT_FFI_EXPORT
void
moonbit_tonyfettes_c_pointer_store_size(void *pointer, size_t value) {
  *((size_t *)pointer) = value;
}
