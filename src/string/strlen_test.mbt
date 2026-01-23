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
test "strlen[Bytes]" {
  let s : Bytes = b"Hello, World!\x00"
  let len : @stddef.Size = @string.strlen(s)
  json_inspect(len, content=13)
}

///|
test "strlen[Pointer[Byte]]" {
  let s : Bytes = b"Hello, World!\x00"
  let ptr : @pointer.Pointer[Byte] = @memory.malloc(
    @sizeof.Byte * s.length().to_uint64(),
  )
  defer @memory.free(ptr)
  for i in 0..<s.length() {
    ptr[i] = s[i]
  }
  let len : @stddef.Size = @string.strlen(ptr)
  json_inspect(len, content=13)
}
