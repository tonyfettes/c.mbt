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
test "memcpy_from_bytes" {
  let bytes : Bytes = Bytes::makei(8, i => i.to_byte())
  let ptr : @c.Ptr[Byte] = @memory.malloc(8)
  defer @memory.free(ptr)
  @memory.memcpy_from_bytes(ptr, bytes, 8)
  @json.inspect(ptr[0], content=0)
  @json.inspect(ptr[1], content=1)
  @json.inspect(ptr[2], content=2)
  @json.inspect(ptr[3], content=3)
  @json.inspect(ptr[4], content=4)
  @json.inspect(ptr[5], content=5)
  @json.inspect(ptr[6], content=6)
  @json.inspect(ptr[7], content=7)
}

///|
test "memcpy_to_bytes" {
  let bytes = Bytes::make(8, 0)
  let ptr : @c.Ptr[Byte] = @memory.malloc(8)
  defer @memory.free(ptr)
  ptr[0] = 0
  ptr[1] = 1
  ptr[2] = 2
  ptr[3] = 3
  ptr[4] = 4
  ptr[5] = 5
  ptr[6] = 6
  ptr[7] = 7
  @memory.memcpy_to_bytes(bytes, ptr, 8)
}
