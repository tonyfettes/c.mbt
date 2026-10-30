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
pub extern "c" fn get() -> Int32 = "moonbit_tonyfettes_c_errno_get"

///|
pub extern "c" fn set(value : Int32) = "moonbit_tonyfettes_c_errno_set"

///|
pub(all) suberror Errno {
  Errno(Int32)
}

///|
pub extern "c" fn strerror(value : Int32) -> @pointer.Pointer[Byte] = "moonbit_tonyfettes_c_errno_strerror"

///|
pub extern "c" fn errno_edom() -> Int32 = "moonbit_tonyfettes_c_errno_edom"

///|
pub let edom : Int32 = errno_edom()

///|
pub extern "c" fn errno_erange() -> Int32 = "moonbit_tonyfettes_c_errno_erange"

///|
pub let erange : Int32 = errno_erange()

///|
pub impl Show for Errno with fn output(self : Errno, logger : &Logger) -> Unit {
  let Errno(value) = self
  let str = strerror(value)
  let mut len = 0
  while str[len] != 0 {
    len += 1
  }
  let buf : FixedArray[Byte] = FixedArray::make(len, 0)
  for i in 0..<len {
    buf[i] = str[i]
  }
  logger.write_string(
    @encoding/utf8.decode_lossy(buf.unsafe_reinterpret_as_bytes()),
  )
}

///|
pub extend Errno with Show::{to_string, output}

///|
pub impl ToJson for Errno with fn to_json(self : Errno) -> Json {
  let Errno(value) = self
  ["Errno", [value, self.to_string()]]
}

///|
pub extend Errno with ToJson::{to_json}
