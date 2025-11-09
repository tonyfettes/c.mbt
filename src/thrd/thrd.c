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

#include <assert.h>
#include <moonbit.h>

#if !defined(__STDC_NO_THREADS__) && __STDC_VERSION__ >= 201112L
#include <threads.h>

MOONBIT_FFI_EXPORT
uint64_t
moonbit_tonyfettes_c_sizeof_thrd(void) {
  return sizeof(thrd_t);
}

MOONBIT_FFI_EXPORT
int32_t
moonbit_tonyfettes_c_thrd_success(void) {
  return thrd_success;
}

MOONBIT_FFI_EXPORT
int32_t
moonbit_tonyfettes_c_thrd_nomem(void) {
  return thrd_nomem;
}

MOONBIT_FFI_EXPORT
int32_t
moonbit_tonyfettes_c_thrd_timedout(void) {
  return thrd_timedout;
}

MOONBIT_FFI_EXPORT
int32_t
moonbit_tonyfettes_c_thrd_busy(void) {
  return thrd_busy;
}

MOONBIT_FFI_EXPORT
int32_t
moonbit_tonyfettes_c_thrd_error(void) {
  return thrd_error;
}

#else

#include <assert.h>

MOONBIT_FFI_EXPORT
uint64_t
moonbit_tonyfettes_c_sizeof_thrd(void) {
  assert(0 && "<threads.h> is not available on this platform");
}

MOONBIT_FFI_EXPORT
int32_t
moonbit_tonyfettes_c_thrd_success(void) {
  assert(0 && "<threads.h> is not available on this platform");
}

MOONBIT_FFI_EXPORT
int32_t
moonbit_tonyfettes_c_thrd_nomem(void) {
  assert(0 && "<threads.h> is not available on this platform");
}

MOONBIT_FFI_EXPORT
int32_t
moonbit_tonyfettes_c_thrd_timedout(void) {
  assert(0 && "<threads.h> is not available on this platform");
}

MOONBIT_FFI_EXPORT
int32_t
moonbit_tonyfettes_c_thrd_busy(void) {
  assert(0 && "<threads.h> is not available on this platform");
}

MOONBIT_FFI_EXPORT
int32_t
moonbit_tonyfettes_c_thrd_error(void) {
  assert(0 && "<threads.h> is not available on this platform");
}

#endif
