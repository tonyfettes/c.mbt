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
#include <stdio.h>

MOONBIT_FFI_EXPORT
int32_t
moonbit_tonyfettes_c_stdio_EOF() {
  return EOF;
}

MOONBIT_FFI_EXPORT
FILE *
moonbit_tonyfettes_c_stdio_stdin() {
  return stdin;
}

MOONBIT_FFI_EXPORT
FILE *
moonbit_tonyfettes_c_stdio_stdout() {
  return stdout;
}

MOONBIT_FFI_EXPORT
FILE *
moonbit_tonyfettes_c_stdio_stderr() {
  return stderr;
}

MOONBIT_FFI_EXPORT
bool
moonbit_c_fgets(moonbit_bytes_t data, FILE *stream) {
  return fgets((char *)data, Moonbit_array_length(data), stream) != NULL;
}

MOONBIT_FFI_EXPORT
int32_t
moonbit_c_fputs(moonbit_bytes_t data, FILE *stream) {
  return fputs((const char *)data, stream);
}
