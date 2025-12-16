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
extern "c" fn memory_memcmp(
  dst : @pointer.Pointer[Unit],
  src : @pointer.Pointer[Unit],
  len : UInt64,
) -> Unit = "moonbit_tonyfettes_c_memory_memcmp"

///|
pub fn[Lhs : @pointer.Borrow, Rhs : @pointer.Borrow] memcmp(
  lhs : Lhs,
  rhs : Rhs,
  len : @stddef.Size,
) -> Unit {
  @pointer.borrow_2(lhs, rhs, (lhs, rhs) => memory_memcmp(
    lhs,
    rhs,
    len.to_uint64(),
  ))
}
