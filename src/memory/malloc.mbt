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
extern "c" fn memory_malloc(size : UInt64) -> @pointer.Pointer[Unit] = "moonbit_tonyfettes_c_memory_malloc"

///|
/// Allocates memory on the heap.
///
/// This function is a wrapper around the C `malloc` function. It allocates
/// a block of memory of the specified size and returns a pointer to it.
/// The memory is not initialized.
///
/// Parameters:
/// - `size`: The number of bytes to allocate
///
/// Returns a pointer to the allocated memory, or a null pointer if allocation fails.
///
/// **Note**: The caller is responsible for freeing the allocated memory using `free`.
pub fn[T] malloc(size : UInt64) -> @pointer.Pointer[T] {
  memory_malloc(size).cast()
}
