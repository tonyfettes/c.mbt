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
extern "c" fn c_fputs(data : @pointer.Pointer[Byte], stream : File) -> Int = "moonbit_tonyfettes_c_stdio_fputs"

///|
/// Writes a string to the specified file stream.
///
/// Parameters:
///
/// * `data` : The string data to write to the stream.
/// * `stream` : The file stream to write to.
///
/// Returns a non-negative integer on success, or EOF on error.
pub fn[Data : @string.Borrow] fputs(data : Data, stream : File) -> Int {
  @string.borrow(data, data => c_fputs(data, stream))
}
