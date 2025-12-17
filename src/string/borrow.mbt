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
  from(Self) -> @pointer.Pointer[Byte]
  into(ptr : @pointer.Pointer[Byte]) -> Self
}

///|
pub fn[T : Borrow, R] borrow(value : T, f : (@pointer.Pointer[Byte]) -> R) -> R {
  let ptr = Borrow::from(value)
  let val : R = f(ptr)
  let _ : T = Borrow::into(ptr)
  val
}

///|
#inline
#locals(f)
pub fn[A : Borrow, B : Borrow, R] borrow_2(
  a : A,
  b : B,
  f : (@pointer.Pointer[Byte], @pointer.Pointer[Byte]) -> R,
) -> R {
  let ptr_a = Borrow::from(a)
  let ptr_b = Borrow::from(b)
  let val : R = for {
    break f(ptr_a, ptr_b)
  }
  let _ : A = Borrow::into(ptr_a)
  let _ : B = Borrow::into(ptr_b)
  val
}

///|
pub impl Borrow for Bytes with from(self : Bytes) -> @pointer.Pointer[Byte] {
  @pointer.from_bytes(self)
}

///|
pub impl Borrow for Bytes with into(ptr : @pointer.Pointer[Byte]) -> Bytes {
  @pointer.into_bytes(ptr)
}

///|
pub impl Borrow for FixedArray[Byte] with from(self : FixedArray[Byte]) -> @pointer.Pointer[
  Byte,
] {
  @pointer.from_array(self)
}

///|
pub impl Borrow for FixedArray[Byte] with into(
  ptr : @pointer.Pointer[Byte],
) -> FixedArray[Byte] {
  @pointer.into_array(ptr)
}

///|
pub impl Borrow for @pointer.Pointer[Byte] with from(
  self : @pointer.Pointer[Byte],
) -> @pointer.Pointer[Byte] {
  self
}

///|
pub impl Borrow for @pointer.Pointer[Byte] with into(
  ptr : @pointer.Pointer[Byte],
) -> @pointer.Pointer[Byte] {
  ptr
}
