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
trait Borrow {
  take_from(Self) -> @pointer.Pointer[Byte]
  move_into(ptr : @pointer.Pointer[Byte]) -> Self
}

///|
pub fn[T : Borrow, R] borrow(value : T, f : (@pointer.Pointer[Byte]) -> R) -> R {
  let ptr = T::take_from(value)
  let val : R = f(ptr)
  let _ : T = T::move_into(ptr)
  val
}

///|
pub fn[A : Borrow, B : Borrow, R] borrow_2(
  a : A,
  b : B,
  f : (@pointer.Pointer[Byte], @pointer.Pointer[Byte]) -> R,
) -> R {
  let ptr_a = A::take_from(a)
  let ptr_b = B::take_from(b)
  let val : R = f(ptr_a, ptr_b)
  let _ : A = A::move_into(ptr_a)
  let _ : B = B::move_into(ptr_b)
  val
}

///|
pub impl Borrow for Bytes with take_from(self : Bytes) -> @pointer.Pointer[Byte] {
  @pointer.take_from_bytes(self)
}

///|
pub impl Borrow for Bytes with move_into(ptr : @pointer.Pointer[Byte]) -> Bytes {
  @pointer.move_into_bytes(ptr)
}

///|
pub impl Borrow for FixedArray[Byte] with take_from(self : FixedArray[Byte]) -> @pointer.Pointer[
  Byte,
] {
  @pointer.take_from_array(self)
}

///|
pub impl Borrow for FixedArray[Byte] with move_into(
  ptr : @pointer.Pointer[Byte],
) -> FixedArray[Byte] {
  @pointer.move_into_array(ptr)
}

///|
pub impl Borrow for @pointer.Pointer[Byte] with take_from(
  self : @pointer.Pointer[Byte],
) -> @pointer.Pointer[Byte] {
  self
}

///|
pub impl Borrow for @pointer.Pointer[Byte] with move_into(
  ptr : @pointer.Pointer[Byte],
) -> @pointer.Pointer[Byte] {
  ptr
}
