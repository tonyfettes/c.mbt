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
extern "c" fn memory_calloc(
  n : UInt64,
  size : UInt64,
) -> @pointer.Pointer[Unit] = "moonbit_tonyfettes_c_memory_calloc"

///|
/// Allocates and zeroes memory on the heap.
///
/// This function is a wrapper around the C `calloc` function. It allocates
/// memory for an array of `n` elements, each of `size` bytes, and initializes
/// all bytes to zero.
///
/// Parameters:
/// - `n`: The number of elements to allocate
/// - `size`: The size of each element in bytes
///
/// Returns a pointer to the allocated and zeroed memory, or a null pointer if allocation fails.
///
/// **Note**: The caller is responsible for freeing the allocated memory using `free`.
pub fn[T] calloc(n : UInt64, size : @stddef.Size) -> @pointer.Pointer[T] {
  memory_calloc(n, size.to_uint64()).cast()
}
