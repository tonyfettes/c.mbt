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
int32_t
moonbit_tonyfettes_c_thrd_create(
  thrd_t *thread,
  int32_t (*func)(void *),
  void *arg
) {
  return thrd_create(thread, func, arg);
}

#else

MOONBIT_FFI_EXPORT
int32_t
moonbit_tonyfettes_c_thrd_create(
  void *thread,
  int32_t (*func)(void *),
  void *arg
) {
  assert(0 && "<threads.h> is not available on this platform");
}

#endif
