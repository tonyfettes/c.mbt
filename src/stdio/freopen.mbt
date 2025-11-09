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
extern "c" fn c_freopen(
  path : @c.Pointer[Byte],
  mode : @c.Pointer[Byte],
  stream : FILE,
) -> FILE = "freopen"

///|
pub fn[Path : @c.BytesLike, Mode : @c.BytesLike] freopen(
  path : Path,
  mode : Mode,
  stream : FILE,
) -> FILE raise @errno.Errno {
  let file = @c.borrow_bytes_2(path, mode, (path, mode) => c_freopen(
    path, mode, stream,
  ))
  if file.is_null() {
    raise @errno.Errno(@errno.get())
  } else {
    file
  }
}
