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
#alias(Pointer)
pub type Ptr[_]

///|
pub fn[T, U] Ptr::cast(self : Ptr[T]) -> Ptr[U] = "%identity"

///|
extern "c" fn pointer_null() -> Ptr[Unit] = "moonbit_tonyfettes_c_pointer_null"

///|
pub fn[T] Ptr::null() -> Ptr[T] {
  pointer_null().cast()
}

///|
extern "c" fn pointer_is_null(ptr : Ptr[Unit]) -> Bool = "moonbit_tonyfettes_c_pointer_is_null"

///|
pub fn[T] Ptr::is_null(self : Ptr[T]) -> Bool {
  pointer_is_null(self.cast())
}

///|
extern "c" fn pointer_is_not_null(ptr : Ptr[Unit]) -> Bool = "moonbit_tonyfettes_c_pointer_is_not_null"

///|
pub fn[T] Ptr::is_not_null(self : Ptr[T]) -> Bool {
  pointer_is_not_null(self.cast())
}

///|
extern "c" fn Ptr::pointer_equal(self : Ptr[Unit], other : Ptr[Unit]) -> Bool = "moonbit_tonyfettes_c_pointer_equal"

///|
pub impl[T] Eq for Ptr[T] with equal(self : Ptr[T], other : Ptr[T]) -> Bool {
  self.cast().pointer_equal(other.cast())
}

///|
extern "c" fn pointer_compare(lower : Ptr[Byte], upper : Ptr[Byte]) -> Int = "moonbit_tonyfettes_c_pointer_compare"

///|
pub impl[T] Compare for Ptr[T] with compare(self : Ptr[T], other : Ptr[T]) -> Int {
  pointer_compare(self.cast(), other.cast())
}

///|
extern "c" fn sizeof_pointer() -> UInt64 = "moonbit_tonyfettes_c_sizeof_pointer"

///|
pub fn Ptr::sizeof() -> UInt64 {
  sizeof_pointer()
}

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
pub fn[T] Ptr::add(self : Ptr[T], offset : UInt64) -> Ptr[T] {
  let array = return_array(self)
  borrow_array(array_offset(array, offset.reinterpret_as_int64()))
}

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
pub fn[T] Ptr::sub(self : Ptr[T], offset : UInt64) -> Ptr[T] {
  let array = return_array(self)
  borrow_array(array_offset(array, -offset.reinterpret_as_int64()))
}

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
pub fn[T] Ptr::offset(self : Ptr[T], offset : Int64) -> Ptr[T] {
  if offset > 0 {
    self.add(offset.reinterpret_as_uint64())
  } else {
    self.sub((-offset).reinterpret_as_uint64())
  }
}

///|
fn[T] array_offset(array : FixedArray[T], offset : Int64) -> FixedArray[T] = "%i64_add"

///|
fn[T] array_offset_from(array : FixedArray[T], from : FixedArray[T]) -> Int64 = "%i64_sub"

///|
pub fn[T] Ptr::offset_from(self : Ptr[T], other : Ptr[T]) -> Int64 {
  let self_array = return_array(self)
  let other_array = return_array(other)
  let offset = array_offset_from(self_array, other_array)
  offset
}

///|
pub fn[T] Ptr::byte_offset_from(self : Ptr[T], other : Ptr[T]) -> Int64 {
  let self_array = return_array(self)
  let other_array = return_array(other)
  let byte_self : Ptr[Byte] = borrow_array(self_array).cast()
  let byte_other : Ptr[Byte] = borrow_array(other_array).cast()
  let offset = byte_self.offset_from(byte_other)
  offset
}

///|
pub fn[T] Ptr::op_get(self : Ptr[T], index : UInt64) -> T {
  let array = return_array(self)
  let value = array.unsafe_get(index.to_int())
  ignore(borrow_array(array))
  value
}

///|
pub fn[T] Ptr::op_set(self : Ptr[T], index : UInt64, value : T) -> Unit {
  let array = return_array(self)
  array.unsafe_set(index.to_int(), value)
  ignore(borrow_array(array))
}

///|
pub fn[T] Ptr::load(self : Ptr[T]) -> T {
  let ref_ = return_ref(self)
  let value = ref_.val
  ignore(borrow_ref(ref_))
  value
}

///|
pub fn[T] Ptr::store(self : Ptr[T], value : T) -> Unit {
  let ref_ = return_ref(self)
  ref_.val = value
  ignore(borrow_ref(ref_))
}

///|
extern "c" fn pointer_to_uint64(pointer : Ptr[Unit]) -> UInt64 = "moonbit_tonyfettes_c_pointer_to_uint64"

///|
pub fn[T] Ptr::to_uint64(self : Ptr[T]) -> UInt64 {
  pointer_to_uint64(self.cast())
}

///|
pub fn[T] borrow_array(array : FixedArray[T]) -> Ptr[T] = "%identity"

///|
pub fn[T] return_array(pointer : Ptr[T]) -> FixedArray[T] = "%identity"

///|
#locals(f)
pub fn[T, R] with_array_borrowed(array : FixedArray[T], f : (Ptr[T]) -> R) -> R {
  let ptr = borrow_array(array)
  let result = f(ptr)
  ignore(return_array(ptr))
  result
}

///|
pub fn[T] borrow_ref(r : Ref[T]) -> Ptr[T] = "%identity"

///|
pub fn[T] return_ref(ptr : Ptr[T]) -> Ref[T] = "%identity"

///|
pub fn[T, R] with_ref_borrowed(r : Ref[T], f : (Ptr[T]) -> R) -> R {
  let ptr = borrow_ref(r)
  let result = f(ptr)
  ignore(return_ref(ptr))
  result
}

///|
pub fn[T] unsafe_borrow(r : T) -> Ptr[Unit] = "%identity"

///|
pub fn[T] unsafe_return(ptr : Ptr[Unit]) -> T = "%identity"

///|
pub fn[T, R] with_unsafe_borrowed(r : T, f : (Ptr[Unit]) -> R) -> R {
  let ptr = unsafe_borrow(r)
  let result = f(ptr)
  let val : T = unsafe_return(ptr)
  ignore(val)
  result
}

///|
fn bytes_as_pointer(bytes : Bytes) -> Ptr[Byte] = "%identity"

///|
fn pointer_as_bytes(ptr : Ptr[Byte]) -> Bytes = "%identity"

///|
trait BytesLike {
  borrow(self : Self) -> Ptr[Byte]
  return_(self : Ptr[Byte]) -> Self
}

///|
pub impl BytesLike for Bytes with borrow(self : Bytes) -> Ptr[Byte] {
  bytes_as_pointer(self)
}

///|
pub impl BytesLike for Bytes with return_(self : Ptr[Byte]) -> Bytes {
  pointer_as_bytes(self)
}

///|
pub impl BytesLike for FixedArray[Byte] with borrow(self : FixedArray[Byte]) -> Ptr[
  Byte,
] {
  borrow_array(self)
}

///|
pub impl BytesLike for FixedArray[Byte] with return_(self : Ptr[Byte]) -> FixedArray[
  Byte,
] {
  return_array(self)
}

///|
pub impl BytesLike for Ptr[Byte] with borrow(self : Ptr[Byte]) -> Ptr[Byte] {
  self
}

///|
pub impl BytesLike for Ptr[Byte] with return_(self : Ptr[Byte]) -> Ptr[Byte] {
  self
}

///|
#locals(f)
pub fn[T : BytesLike, R] borrow_bytes(
  byte_pointer : T,
  f : (Ptr[Byte]) -> R,
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
  f : (Ptr[Byte], Ptr[Byte]) -> R,
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
  f : (FixedArray[Ptr[Byte]]) -> R,
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

///|
pub(open) trait ToPtr {
  to_ptr(Self) -> Ptr[Unit]
}

///|
pub impl[T] ToPtr for Ptr[T] with to_ptr(self : Ptr[T]) -> Ptr[Unit] {
  self.cast()
}

///|
pub(open) trait FromPtr {
  from_ptr(Ptr[Unit]) -> Self
}

///|
pub impl[T] FromPtr for Ptr[T] with from_ptr(self : Ptr[Unit]) -> Ptr[T] {
  self.cast()
}
