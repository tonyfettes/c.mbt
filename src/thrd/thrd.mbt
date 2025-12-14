// Copyright 2025 International Digital Economy Academy
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
type Thrd

///|
pub extern "c" fn Thrd::sizeof() -> UInt64 = "moonbit_tonyfettes_c_sizeof_thrd"

///|
pub impl @sizeof.Sized for Thrd with size() -> @stddef.Size {
  Thrd::sizeof()
}

///|
extern "c" fn thrd_success() -> Int = "moonbit_tonyfettes_c_thrd_success"

///|
pub let success : Int = thrd_success()

///|
extern "c" fn thrd_nomem() -> Int = "moonbit_tonyfettes_c_thrd_nomem"

///|
pub let nomem : Int = thrd_nomem()

///|
extern "c" fn thrd_timedout() -> Int = "moonbit_tonyfettes_c_thrd_timedout"

///|
pub let timedout : Int = thrd_timedout()

///|
extern "c" fn thrd_busy() -> Int = "moonbit_tonyfettes_c_thrd_busy"

///|
pub let busy : Int = thrd_busy()

///|
extern "c" fn thrd_error() -> Int = "moonbit_tonyfettes_c_thrd_error"

///|
pub let error : Int = thrd_error()
