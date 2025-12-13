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
test "realloc" {
  let ptr : @pointer.Pointer[Int] = @memory.malloc(10 * @sizeof.Int)
  for i in 0UL..<10 {
    ptr[i] = i.to_int()
  }
  let new_ptr = @memory.realloc(ptr, 20 * @sizeof.Int)
  defer @memory.free(new_ptr)
  for i in 0UL..<10 {
    @json.inspect(new_ptr[i], content=i.to_int().to_json())
  }
}
