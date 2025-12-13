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
extern "c" fn memory_realloc(
  ptr : @pointer.Pointer[Unit],
  size : UInt64,
) -> @pointer.Pointer[Unit] = "moonbit_tonyfettes_c_memory_realloc"

///|
/// Reallocates a previously allocated memory block.
///
/// This function is a wrapper around the C `realloc` function. It changes the
/// size of the memory block pointed to by `ptr` to `size` bytes. The contents
/// of the memory block are preserved up to the minimum of the old and new sizes.
///
/// Parameters:
/// - `ptr`: A pointer to previously allocated memory (or null)
/// - `size`: The new size in bytes
///
/// Returns a pointer to the reallocated memory, which may be different from `ptr`,
/// or a null pointer if reallocation fails (in which case the original block is unchanged).
///
/// **Note**: If `ptr` is null, this behaves like `malloc`. If `size` is 0, this
/// may behave like `free` (platform-dependent).
pub fn[T] realloc(
  ptr : @pointer.Pointer[T],
  size : UInt64,
) -> @pointer.Pointer[T] {
  memory_realloc(ptr.cast(), size).cast()
}
