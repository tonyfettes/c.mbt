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

#include <errno.h>
#include <moonbit.h>
#include <stdint.h>
#include <string.h>

MOONBIT_FFI_EXPORT
int32_t
moonbit_tonyfettes_c_errno_get() {
  return errno;
}

MOONBIT_FFI_EXPORT
int32_t
moonbit_tonyfettes_c_errno_set(int32_t value) {
  errno = value;
  return errno;
}

MOONBIT_FFI_EXPORT
int32_t
moonbit_tonyfettes_c_errno_edom() {
  return EDOM;
}

MOONBIT_FFI_EXPORT
int32_t
moonbit_tonyfettes_c_errno_erange() {
  return ERANGE;
}

MOONBIT_FFI_EXPORT
void *
moonbit_tonyfettes_c_errno_strerror(int32_t errnum) {
  return (void *)strerror(errnum);
}
