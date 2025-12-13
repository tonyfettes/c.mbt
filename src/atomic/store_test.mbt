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
test "store" {
  if !supports_atomics {
    return
  }
  let object : @atomic.Atomic[Int] = @memory.calloc(
    1,
    @atomic.sizeof((_ : Int) => ()),
  )
  defer @memory.free(object)
  @atomic.init_(object, 0)
  @json.inspect(@atomic.load(object), content=0)
  @atomic.store(object, 1)
  @json.inspect(@atomic.load(object), content=1)
}
