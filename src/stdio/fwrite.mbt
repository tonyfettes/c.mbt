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
extern "c" fn c_fwrite(
  ptr : @c.Ptr[Unit],
  size : UInt64,
  n : UInt64,
  stream : FILE,
) -> UInt64 = "moonbit_tonyfettes_c_stdio_fwrite"

///|
trait Fwrite {
  fwrite(self : Self, n : UInt64, stream : FILE) -> UInt64
}

///|
pub impl[T] Fwrite for FixedArray[T] with fwrite(
  self : FixedArray[T],
  n : UInt64,
  stream : FILE,
) -> UInt64 {
  @c.with_array_borrowed(self, ptr => c_fwrite(
    ptr.cast(),
    @c.sizeof((ignore : (T) -> Unit)),
    n,
    stream,
  ))
}

///|
pub impl[T] Fwrite for @c.Ptr[T] with fwrite(
  ptr : @c.Ptr[T],
  n : UInt64,
  stream : FILE,
) -> UInt64 {
  return c_fwrite(ptr.cast(), @c.sizeof((ignore : (T) -> Unit)), n, stream)
}

///|
pub impl Fwrite for Bytes with fwrite(self : Bytes, n : UInt64, stream : FILE) -> UInt64 {
  @c.borrow_bytes(self, ptr => c_fwrite(ptr.cast(), 1, n, stream))
}

///|
pub fn[T : Fwrite] fwrite(ptr : T, n : UInt64, stream : FILE) -> UInt64 {
  Fwrite::fwrite(ptr, n, stream)
}
