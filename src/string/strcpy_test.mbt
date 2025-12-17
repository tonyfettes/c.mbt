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
test "strcpy" {
  let src = b"hello, world!"
  let src_len = src.length().to_uint64()
  // Allocate memory for a copy of `src` plus null terminator
  let dst : @pointer.Pointer[Byte] = @memory.calloc(@sizeof.Byte, src_len + 1)
  defer @memory.free(dst)
  strcpy(dst, src)
  assert_true(strcmp(dst, src) == 0)
}

///|
test "strncpy" {
  let src = b"hello, world!"
  let src_len = src.length().to_uint64()
  // Allocate memory for a copy of `src` plus null terminator
  let dst : @pointer.Pointer[Byte] = @memory.calloc(@sizeof.Byte, src_len + 1)
  defer @memory.free(dst)
  // Copy only part of the string
  let n = 5UL
  strncpy(dst, src, n)
  // Manually null-terminate the destination
  dst.add(n).store(0)
  assert_true(strcmp(dst, b"hello") == 0)
}
