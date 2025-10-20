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

#include <moonbit.h>
#include <setjmp.h>

MOONBIT_FFI_EXPORT
int32_t
moonbit_tonyfettes_c_sizeof_jmp_buf() {
  return sizeof(jmp_buf);
}

MOONBIT_FFI_EXPORT
void
moonbit_tonyfettes_c_longjmp(void *env, int val) {
  longjmp(env, val);
}

typedef struct moonbit_tonyfettes_c_setjmp_closure {
  int32_t (*code)(struct moonbit_tonyfettes_c_setjmp_closure *, int32_t);
} moonbit_tonyfettes_c_setjmp_closure_t;

MOONBIT_FFI_EXPORT
void
moonbit_tonyfettes_c_setjmp(
  void *env,
  void (*func)(void *, int32_t),
  void *data
) {
  if (setjmp(env) == 0) {
    func(data, 0);
  } else {
    func(data, 1);
  }
  moonbit_decref(data);
}
