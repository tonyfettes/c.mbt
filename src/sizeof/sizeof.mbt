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
fn[T] array_offset(array : FixedArray[T], offset : Int64) -> FixedArray[T] = "%i64_add"

///|
pub fn[T] sizeof(_ : (T) -> Unit) -> UInt64 {
  let ptr : @pointer.Pointer[T] = @pointer.Pointer::null()
  let array = array_offset(@pointer.move_into_array(ptr), 1)
  @pointer.take_from_array(array).byte_offset_from(ptr).reinterpret_as_uint64()
}

///|
pub type Sizeof[T] = ((T) -> Unit) -> UInt64
