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
extern "c" fn c_fgets(
  data : @pointer.Pointer[Byte],
  size : Int,
  stream : File,
) -> @pointer.Pointer[Byte] = "moonbit_tonyfettes_c_stdio_fgets"

///|
pub fn[Data : @string.Borrow] fgets(
  data : Data,
  size : Int,
  stream : File,
) -> Data? {
  let result = @string.borrow(data, data => c_fgets(data, size, stream))
  if result.is_null() {
    None
  } else {
    Some(data)
  }
}
