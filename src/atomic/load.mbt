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
pub(open) trait Load {
  load(ptr : @c.Pointer[Atomic[Self]]) -> Self = _
  load_explicit(ptr : @c.Pointer[Atomic[Self]], order : MemoryOrder) -> Self
}

///|
impl Load with load(ptr : @c.Pointer[Atomic[Self]]) -> Self {
  Load::load_explicit(ptr, MemoryOrder::SeqCst)
}

///|
pub fn[T : Load] load(ptr : @c.Pointer[Atomic[T]]) -> T {
  T::load(ptr)
}

///|
extern "c" fn atomic_load_explicit_int(
  object : @c.Pointer[Atomic[Int]],
  order : MemoryOrder,
) -> Int = "moonbit_tonyfettes_c_atomic_load_explicit_int"

///|
pub impl Load for Int with load_explicit(
  ptr : @c.Pointer[Atomic[Int]],
  order : MemoryOrder,
) -> Int {
  atomic_load_explicit_int(ptr, order)
}
