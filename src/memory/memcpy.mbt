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
extern "c" fn c_memcpy(
  dst : @pointer.Pointer[Unit],
  src : @pointer.Pointer[Unit],
  len : UInt64,
) -> Unit = "moonbit_tonyfettes_c_memory_memcpy"

///|
#alias(memcpy_to_bytes)
#alias(memcpy_from_bytes)
pub fn[Dst, Src] memcpy(dst : Dst, src : Src, len : UInt64) -> Unit {
  @pointer.unsafe_borrow(dst, dst => @pointer.unsafe_borrow(src, src => c_memcpy(dst, src, len)))
}
