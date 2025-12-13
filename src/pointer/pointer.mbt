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
/// **Note**: The offset is of type `Int64` and might be insufficient for very large
/// offsets on some platforms.
pub fn[T] Ptr::offset(self : Ptr[T], offset : Int64) -> Ptr[T] {
  let array = move_into_array(self)
  take_from_array(array_offset(array, offset))
}

///|
pub fn[T] Ptr::byte_offset(self : Ptr[T], offset : Int64) -> Ptr[T] {
  let byte_self : Ptr[Byte] = self.cast()
  byte_self.offset(offset).cast()
}

///|
fn[T] array_offset(array : FixedArray[T], offset : Int64) -> FixedArray[T] = "%i64_add"

///|
fn[T] array_offset_from(array : FixedArray[T], from : FixedArray[T]) -> Int64 = "%i64_sub"

///|
pub fn[T] Ptr::offset_from(self : Ptr[T], other : Ptr[T]) -> Int64 {
  let self_array = move_into_array(self)
  let other_array = move_into_array(other)
  let offset = array_offset_from(self_array, other_array)
  offset
}

///|
pub fn[T] Ptr::byte_offset_from(self : Ptr[T], other : Ptr[T]) -> Int64 {
  let self_array = move_into_array(self)
  let other_array = move_into_array(other)
  let byte_self : Ptr[Byte] = take_from_array(self_array).cast()
  let byte_other : Ptr[Byte] = take_from_array(other_array).cast()
  let offset = byte_self.offset_from(byte_other)
  offset
}

///|
pub fn[T] Ptr::op_get(self : Ptr[T], index : UInt64) -> T {
  let array = move_into_array(self)
  let value = array.unsafe_get(index.to_int())
  ignore(take_from_array(array))
  value
}

///|
pub fn[T] Ptr::op_set(self : Ptr[T], index : UInt64, value : T) -> Unit {
  let array = move_into_array(self)
  array.unsafe_set(index.to_int(), value)
  ignore(take_from_array(array))
}

///|
pub fn[T] Ptr::load(self : Ptr[T]) -> T {
  let ref_ : Ref[T] = move_into_ref(self)
  let value = ref_.val
  ignore(take_from_ref(ref_))
  value
}

///|
pub fn[T] Ptr::store(self : Ptr[T], value : T) -> Unit {
  let ref_ : Ref[T] = move_into_ref(self)
  ref_.val = value
  ignore(take_from_ref(ref_))
}

///|
extern "c" fn pointer_to_uint64(pointer : Ptr[Unit]) -> UInt64 = "moonbit_tonyfettes_c_pointer_to_uint64"

///|
pub fn[T] Ptr::to_uint64(self : Ptr[T]) -> UInt64 {
  pointer_to_uint64(self.cast())
}

///|
pub(open) trait IntoPtr {
  into_ptr(Self) -> Ptr[Unit]
}

///|
pub impl[T] IntoPtr for Ptr[T] with into_ptr(self : Ptr[T]) -> Ptr[Unit] {
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
