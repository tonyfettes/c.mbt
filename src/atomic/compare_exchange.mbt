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
pub(open) trait CompareExchangeStrong {
  compare_exchange_strong(
    ptr : Atomic[Self],
    expected : @c.Ptr[Self],
    desired : Self,
  ) -> Bool = _
  compare_exchange_strong_explicit(
    ptr : Atomic[Self],
    expected : @c.Ptr[Self],
    desired : Self,
    success_order : MemoryOrder,
    failure_order : MemoryOrder,
  ) -> Bool
}

///|
impl CompareExchangeStrong with compare_exchange_strong(
  ptr : Atomic[Self],
  expected : @c.Ptr[Self],
  desired : Self,
) -> Bool {
  CompareExchangeStrong::compare_exchange_strong_explicit(
    ptr,
    expected,
    desired,
    MemoryOrder::SeqCst,
    MemoryOrder::SeqCst,
  )
}

///|
pub fn[T : CompareExchangeStrong] compare_exchange_strong(
  object : Atomic[T],
  expected : @c.Ptr[T],
  desired : T,
) -> Bool {
  CompareExchangeStrong::compare_exchange_strong(object, expected, desired)
}

///|
extern "c" fn atomic_compare_exchange_strong_explicit_int(
  object : Atomic[Int],
  expected : @c.Ptr[Int],
  desired : Int,
  success : MemoryOrder,
  failure : MemoryOrder,
) -> Int = "moonbit_tonyfettes_c_atomic_compare_exchange_strong_explicit_int"

///|
pub impl CompareExchangeStrong for Int with compare_exchange_strong_explicit(
  object : Atomic[Int],
  expected : @c.Ptr[Int],
  desired : Int,
  success : MemoryOrder,
  failure : MemoryOrder,
) -> Bool {
  atomic_compare_exchange_strong_explicit_int(
    object, expected, desired, success, failure,
  ) !=
  0
}

///|
pub(open) trait CompareExchangeWeak {
  compare_exchange_weak(
    ptr : Atomic[Self],
    expected : @c.Ptr[Self],
    desired : Self,
  ) -> Bool = _
  compare_exchange_weak_explicit(
    ptr : Atomic[Self],
    expected : @c.Ptr[Self],
    desired : Self,
    success_order : MemoryOrder,
    failure_order : MemoryOrder,
  ) -> Bool
}

///|
impl CompareExchangeWeak with compare_exchange_weak(
  ptr : Atomic[Self],
  expected : @c.Ptr[Self],
  desired : Self,
) -> Bool {
  CompareExchangeWeak::compare_exchange_weak_explicit(
    ptr,
    expected,
    desired,
    MemoryOrder::SeqCst,
    MemoryOrder::SeqCst,
  )
}

///|
pub fn[T : CompareExchangeWeak] compare_exchange_weak(
  object : Atomic[T],
  expected : @c.Ptr[T],
  desired : T,
) -> Bool {
  CompareExchangeWeak::compare_exchange_weak(object, expected, desired)
}

///|
extern "c" fn atomic_compare_exchange_weak_explicit_int(
  object : Atomic[Int],
  expected : @c.Ptr[Int],
  desired : Int,
  success : MemoryOrder,
  failure : MemoryOrder,
) -> Int = "moonbit_tonyfettes_c_atomic_compare_exchange_weak_explicit_int"

///|
pub impl CompareExchangeWeak for Int with compare_exchange_weak_explicit(
  object : Atomic[Int],
  expected : @c.Ptr[Int],
  desired : Int,
  success : MemoryOrder,
  failure : MemoryOrder,
) -> Bool {
  atomic_compare_exchange_weak_explicit_int(
    object, expected, desired, success, failure,
  ) !=
  0
}
