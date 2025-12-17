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
extern "c" fn string_strcpy(
  dst : @pointer.Pointer[Byte],
  src : @pointer.Pointer[Byte],
) = "moonbit_tonyfettes_c_string_strcpy"

///|
pub fn[Str1 : Borrow, Str2 : Borrow] strcpy(dst : Str1, src : Str2) -> Unit {
  borrow_2(dst, src, (dst, src) => string_strcpy(dst, src))
}

///|
extern "c" fn string_strncpy(
  dst : @pointer.Pointer[Byte],
  src : @pointer.Pointer[Byte],
  n : UInt64,
) = "moonbit_tonyfettes_c_string_strncpy"

///|
pub fn[Str1 : Borrow, Str2 : Borrow] strncpy(
  dst : Str1,
  src : Str2,
  n : @stddef.Size,
) -> Unit {
  borrow_2(dst, src, (dst, src) => string_strncpy(dst, src, n.to_uint64()))
}
