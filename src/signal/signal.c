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
#include <signal.h>

MOONBIT_FFI_EXPORT
int32_t
moonbit_tonyfettes_c_signal_handler_equal(
  void (*handler1)(int),
  void (*handler2)(int)
) {
  return handler1 == handler2;
}

MOONBIT_FFI_EXPORT
void (*moonbit_tonyfettes_c_signal_SIG_DFL(void))(int) { return SIG_DFL; }

MOONBIT_FFI_EXPORT
void (*moonbit_tonyfettes_c_signal_SIG_IGN(void))(int) { return SIG_IGN; }

MOONBIT_FFI_EXPORT
void (*moonbit_tonyfettes_c_signal_SIG_ERR(void))(int) { return SIG_ERR; }

MOONBIT_FFI_EXPORT
int32_t
moonbit_tonyfettes_c_signal_SIGABRT(void) {
  return SIGABRT;
}

MOONBIT_FFI_EXPORT
int32_t
moonbit_tonyfettes_c_signal_SIGFPE(void) {
  return SIGFPE;
}

MOONBIT_FFI_EXPORT
int32_t
moonbit_tonyfettes_c_signal_SIGILL(void) {
  return SIGILL;
}

MOONBIT_FFI_EXPORT
int32_t
moonbit_tonyfettes_c_signal_SIGINT(void) {
  return SIGINT;
}

MOONBIT_FFI_EXPORT
int32_t
moonbit_tonyfettes_c_signal_SIGSEGV(void) {
  return SIGSEGV;
}

MOONBIT_FFI_EXPORT
int32_t
moonbit_tonyfettes_c_signal_SIGTERM(void) {
  return SIGTERM;
}
