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
test "memset" {
  let val : Byte = 0x7f
  let len : @stddef.Size = 16
  let ptr : @pointer.Pointer[Byte] = @memory.malloc(len * @sizeof.Byte)
  defer @memory.free(ptr)
  @memory.memset(ptr, val, len)
  for i in 0..<len.to_int() {
    @json.inspect(ptr[i], content=val.to_json())
  }
}
