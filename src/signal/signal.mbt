// Copyright 2026 International Digital Economy Academy
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

///|
#external
pub type Handler

///|
extern "c" fn Handler::c_equal(self : Handler, other : Handler) -> Int32 = "moonbit_tonyfettes_c_signal_handler_equal"

///|
pub impl Eq for Handler with fn equal(self : Handler, other : Handler) -> Bool {
  Handler::c_equal(self, other) != 0
}

///|
pub extend Handler with Eq::{not_equal, equal}

///|
pub fn handler(f : FuncRef[(Int32) -> Unit]) -> Handler = "%identity"

///|
extern "c" fn c_signal(sig : Int32, handler : Handler) -> Handler = "signal"

///|
pub fn signal(sig : Int32, handler : Handler) -> Handler {
  c_signal(sig, handler)
}

///|
extern "c" fn c_raise(sig : Int32) -> Int32 = "raise"

///|
pub fn raise_(sig : Int32) -> Unit raise @errno.Errno {
  if c_raise(sig) != 0 {
    raise Errno(@errno.get())
  }
}

///|
extern "c" fn c_sig_dfl() -> Handler = "moonbit_tonyfettes_c_signal_SIG_DFL"

///|
pub let sig_dfl : Handler = c_sig_dfl()

///|
extern "c" fn c_sig_ign() -> Handler = "moonbit_tonyfettes_c_signal_SIG_IGN"

///|
pub let sig_ign : Handler = c_sig_ign()

///|
extern "c" fn c_sig_err() -> Handler = "moonbit_tonyfettes_c_signal_SIG_ERR"

///|
pub let sig_err : Handler = c_sig_err()

///|
extern "c" fn c_sigabrt() -> Int32 = "moonbit_tonyfettes_c_signal_SIGABRT"

///|
pub let sigabrt : Int32 = c_sigabrt()

///|
extern "c" fn c_sigfpe() -> Int32 = "moonbit_tonyfettes_c_signal_SIGFPE"

///|
pub let sigfpe : Int32 = c_sigfpe()

///|
extern "c" fn c_sigill() -> Int32 = "moonbit_tonyfettes_c_signal_SIGILL"

///|
pub let sigill : Int32 = c_sigill()

///|
extern "c" fn c_sigint() -> Int32 = "moonbit_tonyfettes_c_signal_SIGINT"

///|
pub let sigint : Int32 = c_sigint()

///|
extern "c" fn c_sigsegv() -> Int32 = "moonbit_tonyfettes_c_signal_SIGSEGV"

///|
pub let sigsegv : Int32 = c_sigsegv()

///|
extern "c" fn c_sigterm() -> Int32 = "moonbit_tonyfettes_c_signal_SIGTERM"

///|
pub let sigterm : Int32 = c_sigterm()
