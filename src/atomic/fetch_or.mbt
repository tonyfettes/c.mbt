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
pub(open) trait FetchOr {
  fetch_or(ptr : @c.Pointer[Atomic[Self]], value : Self) -> Self = _
  fetch_or_explicit(
    ptr : @c.Pointer[Atomic[Self]],
    value : Self,
    order : MemoryOrder,
  ) -> Self
}

///|
impl FetchOr with fetch_or(ptr : @c.Pointer[Atomic[Self]], value : Self) -> Self {
  FetchOr::fetch_or_explicit(ptr, value, MemoryOrder::SeqCst)
}

///|
pub fn[T : FetchOr] fetch_or(ptr : @c.Pointer[Atomic[T]], value : T) -> T {
  T::fetch_or(ptr, value)
}

///|
extern "c" fn atomic_fetch_or_explicit_int(
  object : @c.Pointer[Atomic[Int]],
  operand : Int,
  order : MemoryOrder,
) -> Int = "moonbit_tonyfettes_c_atomic_fetch_or_explicit_int"

///|
pub impl FetchOr for Int with fetch_or_explicit(
  object : @c.Pointer[Atomic[Int]],
  operand : Int,
  order : MemoryOrder,
) -> Int {
  atomic_fetch_or_explicit_int(object, operand, order)
}
