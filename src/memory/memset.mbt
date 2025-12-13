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

extern "c" fn memory_memset(
  dst : @pointer.Pointer[Unit],
  val : Byte,
  len : UInt64,
) -> Unit = "moonbit_tonyfettes_c_memory_memset"

/// Fills a memory block with a constant byte value.
///
/// This function is a wrapper around the C `memset` function. It fills the first
/// `len` bytes of the memory area pointed to by `dst` with the constant byte `val`.
///
/// Parameters:
/// - `dst`: The destination memory location to fill
/// - `val`: The byte value to fill with
/// - `len`: The number of bytes to fill
///
/// **Note**: The destination memory must have at least `len` bytes accessible.
pub fn[Dst] memset(dst : Dst, val : Byte, len : UInt64) -> Unit {
  @pointer.unsafe_borrow(dst, dst => memory_memset(dst, val, len))
}
