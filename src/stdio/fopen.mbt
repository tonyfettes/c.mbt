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
#borrow(path, mode)
extern "c" fn c_fopen(
  path : @pointer.Pointer[Byte],
  mode : @pointer.Pointer[Byte],
) -> FILE = "moonbit_tonyfettes_c_stdio_fopen"

///|
pub fn[Path : @string.Borrow, Mode : @string.Borrow] fopen(
  path : Path,
  mode : Mode,
) -> FILE raise @errno.Errno {
  let file = @string.borrow_2(path, mode, (path, mode) => c_fopen(path, mode))
  if file.is_null() {
    raise @errno.Errno(@errno.get())
  } else {
    file
  }
}
