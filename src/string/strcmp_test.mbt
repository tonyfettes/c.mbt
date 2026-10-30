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
test "strcmp" {
  let a = b"apple"
  let b = b"banana"
  let c = b"apple"
  assert_true(@string.strcmp(a, b) < 0)
  assert_true(@string.strcmp(b, a) > 0)
  assert_true(@string.strcmp(a, c) == 0)
  let a_len = a.length().to_uint64()
  // Allocate memory for a copy of `a` plus null terminator
  let d : @pointer.Pointer[Byte] = @memory.calloc(@sizeof.Byte, a_len + 1)
  defer @memory.free(d)
  @memory.copy(d, a, a_len)
  assert_true(@string.strcmp(d, a) == 0)
  assert_true(@string.strcmp(d, b) < 0)
  assert_true(@string.strcmp(d, c) == 0)
}

///|
test "strncmp" {
  let a = b"apple"
  let b = b"apricot"
  assert_true(@string.strncmp(a, b, 2) == 0)
  assert_true(@string.strncmp(a, b, 3) < 0)
  assert_true(@string.strncmp(b, a, 3) > 0)
}
