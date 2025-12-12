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

#include <math.h>
#include <moonbit.h>

MOONBIT_FFI_EXPORT
double
moonbit_tonyfettes_c_math_nan(moonbit_bytes_t payload) {
  return nan((const char *)payload);
}

MOONBIT_FFI_EXPORT
float
moonbit_tonyfettes_c_math_nanf(moonbit_bytes_t payload) {
  return nanf((const char *)payload);
}
