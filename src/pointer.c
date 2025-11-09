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

MOONBIT_FFI_EXPORT
void *
moonbit_tonyfettes_c_pointer_null() {
  return NULL;
}

MOONBIT_FFI_EXPORT
int32_t
moonbit_tonyfettes_c_pointer_is_null(void *ptr) {
  return ptr == NULL;
}

MOONBIT_FFI_EXPORT
int32_t
moonbit_tonyfettes_c_pointer_equal(void *ptr1, void *ptr2) {
  return ptr1 == ptr2;
}

MOONBIT_FFI_EXPORT
int32_t
moonbit_tonyfettes_c_pointer_is_not_null(void *ptr) {
  return ptr != NULL;
}

MOONBIT_FFI_EXPORT
int32_t
moonbit_tonyfettes_c_pointer_compare(uint8_t *ptr1, uint8_t *ptr2) {
  if (ptr1 < ptr2) {
    return -1;
  } else if (ptr1 > ptr2) {
    return 1;
  } else {
    return 0;
  }
}

MOONBIT_FFI_EXPORT
uint64_t
moonbit_tonyfettes_c_sizeof_pointer() {
  return sizeof(void *);
}

MOONBIT_FFI_EXPORT
uint8_t *
moonbit_tonyfettes_c_pointer_add(uint8_t *pointer, uint64_t offset) {
  return pointer + offset;
}

MOONBIT_FFI_EXPORT
uint8_t *
moonbit_tonyfettes_c_pointer_sub(uint8_t *upper, uint64_t offset) {
  return upper - offset;
}

MOONBIT_FFI_EXPORT
uint8_t *
moonbit_tonyfettes_c_pointer_offset(uint8_t *pointer, int64_t offset) {
  return pointer + offset;
}

MOONBIT_FFI_EXPORT
int64_t
moonbit_tonyfettes_c_pointer_offset_from(uint8_t *upper, uint8_t *lower) {
  return (int64_t)(upper - lower);
}

MOONBIT_FFI_EXPORT
uint64_t
moonbit_tonyfettes_c_pointer_to_uint64(void *pointer) {
  return (uint64_t)(uintptr_t)pointer;
}

MOONBIT_FFI_EXPORT
void *
moonbit_tonyfettes_c_pointer_from_array(void *pointer) {
  return pointer;
}

MOONBIT_FFI_EXPORT
void *
moonbit_tonyfettes_c_pointer_from_bytes(void *pointer) {
  return pointer;
}

MOONBIT_FFI_EXPORT
void *
moonbit_tonyfettes_c_pointer_identity(void *pointer) {
  return pointer;
}
