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
pub(open) trait FetchSub {
  fetch_sub(ptr : Atomic[Self], value : Self) -> Self = _
  fetch_sub_explicit(ptr : Atomic[Self], value : Self, order : MemoryOrder) -> Self
}

///|
impl FetchSub with fetch_sub(ptr : Atomic[Self], value : Self) -> Self {
  FetchSub::fetch_sub_explicit(ptr, value, MemoryOrder::SeqCst)
}

///|
pub fn[T : FetchSub] fetch_sub(ptr : Atomic[T], value : T) -> T {
  T::fetch_sub(ptr, value)
}

///|
extern "c" fn atomic_fetch_sub_explicit_int(
  object : Atomic[Int],
  operand : Int,
  order : MemoryOrder,
) -> Int = "moonbit_tonyfettes_c_atomic_fetch_sub_explicit_int"

///|
pub impl FetchSub for Int with fetch_sub_explicit(
  object : Atomic[Int],
  operand : Int,
  order : MemoryOrder,
) -> Int {
  atomic_fetch_sub_explicit_int(object, operand, order)
}
