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
test "compare_exchange_strong" {
  if !supports_atomics {
    return
  }
  let object : @atomic.Atomic[Int] = @memory.calloc(
    1,
    @atomic.sizeof((_ : Int) => ()),
  )
  defer @memory.free(object.to_pointer())
  @atomic.init_(object, 1)
  let expected : @pointer.Pointer[Int] = @memory.calloc(1, @sizeof.Int)
  defer @memory.free(expected)
  expected.store(1)
  json_inspect(
    @atomic.compare_exchange_strong(object, expected, 2),
    content=true,
  )
  json_inspect(@atomic.load(object), content=2)
  json_inspect(
    @atomic.compare_exchange_strong(object, expected, 3),
    content=false,
  )
  json_inspect(@atomic.load(object), content=2)
  json_inspect(expected.load(), content=2)
}

///|
test "compare_exchange_weak" {
  if !supports_atomics {
    return
  }
  let object : @atomic.Atomic[Int] = @memory.calloc(
    1,
    @atomic.sizeof((_ : Int) => ()),
  )
  defer @memory.free(object.to_pointer())
  @atomic.init_(object, 1)
  let expected : @pointer.Pointer[Int] = @memory.calloc(1, @sizeof.Int)
  defer @memory.free(expected)
  expected.store(1)
  json_inspect(
    @atomic.compare_exchange_weak(object, expected, 2),
    content=true,
  )
  json_inspect(@atomic.load(object), content=2)
  json_inspect(
    @atomic.compare_exchange_weak(object, expected, 3),
    content=false,
  )
  json_inspect(@atomic.load(object), content=2)
  json_inspect(expected.load(), content=2)
}
