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

extern "c" fn memory_free(ptr : @pointer.Pointer[Unit]) = "moonbit_tonyfettes_c_memory_free"

/// Frees previously allocated memory.
///
/// This function is a wrapper around the C `free` function. It deallocates
/// the memory block pointed to by `ptr`, which must have been previously
/// allocated by `malloc`, `calloc`, or `realloc`.
///
/// Parameters:
/// - `ptr`: A pointer to the memory block to free
///
/// **Note**: After calling `free`, the pointer becomes invalid and should not be used.
/// Freeing a null pointer is safe and does nothing. Freeing the same pointer twice
/// or freeing a pointer not returned by allocation functions leads to undefined behavior.
pub fn[T] free(ptr : @pointer.Pointer[T]) -> Unit {
  memory_free(ptr.cast())
}
