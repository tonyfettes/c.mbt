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
#external
#alias(Ptr)
pub type Pointer[_]

///|
pub fn[T, U] Pointer::cast(self : Pointer[T]) -> Pointer[U] = "%identity"

///|
extern "c" fn pointer_null() -> Pointer[Unit] = "moonbit_tonyfettes_c_pointer_null"

///|
pub fn[T] Pointer::null() -> Pointer[T] {
  pointer_null().cast()
}

///|
extern "c" fn pointer_is_null(ptr : Pointer[Unit]) -> Bool = "moonbit_tonyfettes_c_pointer_is_null"

///|
pub fn[T] Pointer::is_null(self : Pointer[T]) -> Bool {
  pointer_is_null(self.cast())
}

///|
extern "c" fn pointer_is_not_null(ptr : Pointer[Unit]) -> Bool = "moonbit_tonyfettes_c_pointer_is_not_null"

///|
pub fn[T] Pointer::is_not_null(self : Pointer[T]) -> Bool {
  pointer_is_not_null(self.cast())
}

///|
extern "c" fn Pointer::pointer_equal(
  self : Pointer[Unit],
  other : Pointer[Unit],
) -> Bool = "moonbit_tonyfettes_c_pointer_equal"

///|
pub impl[T] Eq for Pointer[T] with equal(self : Pointer[T], other : Pointer[T]) -> Bool {
  self.cast().pointer_equal(other.cast())
}

///|
extern "c" fn pointer_compare(
  lower : Pointer[Byte],
  upper : Pointer[Byte],
) -> Int = "moonbit_tonyfettes_c_pointer_compare"

///|
pub impl[T] Compare for Pointer[T] with compare(
  self : Pointer[T],
  other : Pointer[T],
) -> Int {
  pointer_compare(self.cast(), other.cast())
}

///|
extern "c" fn sizeof_pointer() -> UInt64 = "moonbit_tonyfettes_c_sizeof_pointer"

///|
pub impl[T] Sizeof for Pointer[T] with sizeof() -> UInt64 {
  sizeof_pointer()
}

///|
extern "c" fn pointer_add(
  pointer : Pointer[Byte],
  offset : UInt64,
) -> Pointer[Byte] = "moonbit_tonyfettes_c_pointer_add"

///|
/// Adds an offset to a pointer and returns a new pointer.
///
/// Parameters:
///
/// - `pointer`: The original pointer.
/// - `offset`: The offset to add, in number of elements of type `T`.
///
/// Returns a new pointer that is offset from the original pointer by the
/// specified number of elements.
///
/// **Note**: The offset is subject to overflow.
pub fn[T : Sizeof] Pointer::add(
  self : Pointer[T],
  offset : UInt64,
) -> Pointer[T] {
  pointer_add(self.cast(), offset * T::sizeof()).cast()
}

///|
extern "c" fn pointer_sub(
  pointer : Pointer[Byte],
  offset : UInt64,
) -> Pointer[Byte] = "moonbit_tonyfettes_c_pointer_sub"

///|
/// Subtracts an offset from a pointer and returns a new pointer.
///
/// Parameters:
///
/// - `pointer`: The original pointer.
/// - `offset`: The offset to subtract, in number of elements of type `T`.
///
/// Returns a new pointer that is offset from the original pointer by the
/// specified number of elements.
///
/// **Note**: The offset is subject to overflow.
pub fn[T : Sizeof] Pointer::sub(
  self : Pointer[T],
  offset : UInt64,
) -> Pointer[T] {
  pointer_sub(self.cast(), offset * T::sizeof()).cast()
}

///|
extern "c" fn pointer_offset(
  pointer : Pointer[Byte],
  offset : Int64,
) -> Pointer[Byte] = "moonbit_tonyfettes_c_pointer_offset"

///|
/// Adds an offset to a pointer and returns a new pointer.
///
/// Parameters:
///
/// - `pointer`: The original pointer.
/// - `offset`: The offset to add, in number of elements of type `T`.
///
/// Returns a new pointer that is offset from the original pointer by the
/// specified number of elements.
///
/// **Note**: The offset is of type `Int64` and might be insufficient for very large
/// offsets on some platforms.
pub fn[T : Sizeof] Pointer::offset(
  self : Pointer[T],
  offset : Int64,
) -> Pointer[T] {
  pointer_offset(self.cast(), offset * T::sizeof().reinterpret_as_int64()).cast()
}

///|
extern "c" fn pointer_offset_from(
  upper : Pointer[Byte],
  lower : Pointer[Byte],
) -> Int64 = "moonbit_tonyfettes_c_pointer_offset_from"

///|
pub fn[T : Sizeof] Pointer::offset_from(
  self : Pointer[T],
  other : Pointer[T],
) -> Int64 {
  pointer_offset_from(self.cast(), other.cast()) /
  T::sizeof().reinterpret_as_int64()
}

///|
pub fn[T] Pointer::op_get(self : Pointer[T], index : UInt64) -> T {
  let array = return_array(self)
  let value = array.unsafe_get(index.to_int())
  ignore(borrow_array(array))
  value
}

///|
pub fn[T] Pointer::op_set(self : Pointer[T], index : UInt64, value : T) -> Unit {
  let array = return_array(self)
  array.unsafe_set(index.to_int(), value)
  ignore(borrow_array(array))
}

///|
pub fn[T] Pointer::load(self : Pointer[T]) -> T {
  let ref_ = return_ref(self)
  let value = ref_.val
  ignore(borrow_ref(ref_))
  value
}

///|
pub fn[T] Pointer::store(self : Pointer[T], value : T) -> Unit {
  let ref_ = return_ref(self)
  ref_.val = value
  ignore(borrow_ref(ref_))
}

///|
extern "c" fn pointer_to_uint64(pointer : Pointer[Unit]) -> UInt64 = "moonbit_tonyfettes_c_pointer_to_uint64"

///|
pub fn[T] Pointer::to_uint64(self : Pointer[T]) -> UInt64 {
  pointer_to_uint64(self.cast())
}

///|
pub fn[T] borrow_array(array : FixedArray[T]) -> Pointer[T] = "%identity"

///|
pub fn[T] return_array(pointer : Pointer[T]) -> FixedArray[T] = "%identity"

///|
#locals(f)
pub fn[T, R] with_array_borrowed(
  array : FixedArray[T],
  f : (Pointer[T]) -> R,
) -> R {
  let ptr = borrow_array(array)
  let result = f(ptr)
  ignore(return_array(ptr))
  result
}

///|
pub fn[T] borrow_ref(r : Ref[T]) -> Pointer[T] = "%identity"

///|
pub fn[T] return_ref(ptr : Pointer[T]) -> Ref[T] = "%identity"

///|
pub fn[T, R] with_ref_borrowed(r : Ref[T], f : (Pointer[T]) -> R) -> R {
  let ptr = borrow_ref(r)
  let result = f(ptr)
  ignore(return_ref(ptr))
  result
}

///|
pub fn[T] unsafe_borrow(r : T) -> Pointer[Unit] = "%identity"

///|
pub fn[T] unsafe_return(ptr : Pointer[Unit]) -> T = "%identity"

///|
pub fn[T, R] with_unsafe_borrowed(r : T, f : (Pointer[Unit]) -> R) -> R {
  let ptr = unsafe_borrow(r)
  let result = f(ptr)
  let val : T = unsafe_return(ptr)
  ignore(val)
  result
}

///|
fn bytes_as_pointer(bytes : Bytes) -> Pointer[Byte] = "%identity"

///|
fn pointer_as_bytes(ptr : Pointer[Byte]) -> Bytes = "%identity"

///|
trait BytesLike {
  borrow(self : Self) -> Pointer[Byte]
  return_(self : Pointer[Byte]) -> Self
}

///|
pub impl BytesLike for Bytes with borrow(self : Bytes) -> Pointer[Byte] {
  bytes_as_pointer(self)
}

///|
pub impl BytesLike for Bytes with return_(self : Pointer[Byte]) -> Bytes {
  pointer_as_bytes(self)
}

///|
pub impl BytesLike for FixedArray[Byte] with borrow(self : FixedArray[Byte]) -> Pointer[
  Byte,
] {
  borrow_array(self)
}

///|
pub impl BytesLike for FixedArray[Byte] with return_(self : Pointer[Byte]) -> FixedArray[
  Byte,
] {
  return_array(self)
}

///|
pub impl BytesLike for Pointer[Byte] with borrow(self : Pointer[Byte]) -> Pointer[
  Byte,
] {
  self
}

///|
pub impl BytesLike for Pointer[Byte] with return_(self : Pointer[Byte]) -> Pointer[
  Byte,
] {
  self
}

///|
#locals(f)
pub fn[T : BytesLike, R] borrow_bytes(
  byte_pointer : T,
  f : (Pointer[Byte]) -> R,
) -> R {
  let ptr = T::borrow(byte_pointer)
  let result = f(ptr)
  ignore(T::return_(ptr))
  result
}

///|
#locals(f)
pub fn[A : BytesLike, B : BytesLike, R] borrow_bytes_2(
  a : A,
  b : B,
  f : (Pointer[Byte], Pointer[Byte]) -> R,
) -> R {
  let ptr_a = A::borrow(a)
  let ptr_b = B::borrow(b)
  let result = f(ptr_a, ptr_b)
  ignore(A::return_(ptr_a))
  ignore(B::return_(ptr_b))
  result
}

///|
#locals(f)
pub fn[A : BytesLike, R] borrow_bytes_n(
  array : FixedArray[A],
  f : (FixedArray[Pointer[Byte]]) -> R,
) -> R {
  let ptr = FixedArray::makei(array.length(), i => A::borrow(array[i]))
  let result = f(ptr)
  for p in ptr {
    ignore(A::return_(p))
  }
  result
}

///|
trait Decref {
  decref(self : Self) -> Unit
}

///|
pub impl[T] Decref for FixedArray[T] with decref(self : FixedArray[T]) -> Unit {
  let ptr = borrow_array(self)
  ignore(return_array(ptr))
  ignore(return_array(ptr))
}

///|
pub fn[T : Decref] decref(value : T) -> Unit {
  value.decref()
}

///|
pub impl Decref for Bytes with decref(self : Bytes) -> Unit {
  let ptr = bytes_as_pointer(self)
  ignore(pointer_as_bytes(ptr))
  ignore(pointer_as_bytes(ptr))
}
