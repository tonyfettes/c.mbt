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
/// A generic pointer type that wraps the underlying platform pointer type.
///
/// `Pointer[T]` represents a pointer to a value of type `T`. This type is used
/// for low-level memory operations and interoperability with C code.
#external
#alias(Ptr)
pub type Pointer[_]

///|
/// Casts a pointer from one type to another.
///
/// This is an unsafe operation that reinterprets the pointer without any type checking.
///
/// Parameters:
/// - `self`: The pointer to cast
///
/// Returns a pointer to type `U`
pub fn[T, U] Pointer::cast(self : Pointer[T]) -> Pointer[U] = "%identity"

///|
pub fn[T] Pointer::cast_to_unit(self : Pointer[T]) -> Pointer[Unit] {
  self.cast()
}

///|
pub fn[T] Pointer::cast_to_byte(self : Pointer[T]) -> Pointer[Byte] {
  self.cast()
}

///|
extern "c" fn pointer_null() -> Pointer[Unit] = "moonbit_tonyfettes_c_pointer_null"

///|
/// Creates a null pointer of type `T`.
///
/// Returns a null pointer that points to no valid memory location.
#as_free_fn
pub fn[T] Pointer::null() -> Pointer[T] {
  pointer_null().cast()
}

///|
extern "c" fn pointer_is_null(ptr : Pointer[Unit]) -> Bool = "moonbit_tonyfettes_c_pointer_is_null"

///|
/// Checks if the pointer is null.
///
/// Returns `true` if the pointer is null, `false` otherwise.
pub fn[T] Pointer::is_null(self : Pointer[T]) -> Bool {
  pointer_is_null(self.cast())
}

///|
extern "c" fn pointer_is_not_null(ptr : Pointer[Unit]) -> Bool = "moonbit_tonyfettes_c_pointer_is_not_null"

///|
/// Checks if the pointer is not null.
///
/// Returns `true` if the pointer is not null, `false` otherwise.
pub fn[T] Pointer::is_not_null(self : Pointer[T]) -> Bool {
  pointer_is_not_null(self.cast())
}

///|
extern "c" fn Pointer::pointer_equal(
  self : Pointer[Unit],
  other : Pointer[Unit],
) -> Bool = "moonbit_tonyfettes_c_pointer_equal"

///|
/// Implements equality comparison for pointers.
///
/// Two pointers are equal if they point to the same memory location.
pub impl[T] Eq for Pointer[T] with equal(self : Pointer[T], other : Pointer[T]) -> Bool {
  self.cast().pointer_equal(other.cast())
}

///|
extern "c" fn pointer_compare(
  lower : Pointer[Byte],
  upper : Pointer[Byte],
) -> Int = "moonbit_tonyfettes_c_pointer_compare"

///|
/// Implements comparison for pointers.
///
/// Compares two pointers based on their memory addresses. Returns:
/// - negative value if `self` < `other`
/// - zero if `self` == `other`
/// - positive value if `self` > `other`
pub impl[T] Compare for Pointer[T] with compare(
  self : Pointer[T],
  other : Pointer[T],
) -> Int {
  pointer_compare(self.cast(), other.cast())
}

///|
/// Returns the size of a pointer in bytes.
///
/// On most platforms, this returns 8 for 64-bit systems or 4 for 32-bit systems.
#as_free_fn
pub extern "c" fn Pointer::sizeof() -> UInt64 = "moonbit_tonyfettes_c_sizeof_pointer"

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
pub fn[T] Pointer::offset(self : Pointer[T], offset : Int64) -> Pointer[T] {
  let array = move_into_array(self)
  take_from_array(array_offset(array, offset))
}

///|
/// Adds a byte offset to a pointer and returns a new pointer.
///
/// This function interprets the pointer as a byte pointer, adds the specified
/// byte offset, and returns the result cast back to the original type.
///
/// Parameters:
/// - `offset`: The byte offset to add
///
/// Returns a new pointer that is offset from the original pointer by the
/// specified number of bytes.
pub fn[T] Pointer::byte_offset(self : Pointer[T], offset : Int64) -> Pointer[T] {
  let byte_self : Pointer[Byte] = self.cast()
  byte_self.offset(offset).cast()
}

///|
fn[T] array_offset(array : FixedArray[T], offset : Int64) -> FixedArray[T] = "%i64_add"

///|
fn[T] array_offset_from(array : FixedArray[T], from : FixedArray[T]) -> Int64 = "%i64_sub"

///|
/// Calculates the offset between two pointers in elements.
///
/// Subtracts `other` from `self` to determine how many elements of type `T`
/// are between the two pointers.
///
/// Parameters:
/// - `other`: The pointer to subtract from this pointer
///
/// Returns the number of elements between the two pointers.
pub fn[T] Pointer::offset_from(self : Pointer[T], other : Pointer[T]) -> Int64 {
  let self_array = move_into_array(self)
  let other_array = move_into_array(other)
  let offset = array_offset_from(self_array, other_array)
  offset
}

///|
/// Calculates the byte offset between two pointers.
///
/// Subtracts `other` from `self` to determine how many bytes are between
/// the two pointers.
///
/// Parameters:
/// - `other`: The pointer to subtract from this pointer
///
/// Returns the number of bytes between the two pointers.
pub fn[T] Pointer::byte_offset_from(
  self : Pointer[T],
  other : Pointer[T],
) -> Int64 {
  let self_array = move_into_array(self)
  let other_array = move_into_array(other)
  let byte_self : Pointer[Byte] = take_from_array(self_array).cast()
  let byte_other : Pointer[Byte] = take_from_array(other_array).cast()
  let offset = byte_self.offset_from(byte_other)
  offset
}

///|
/// Reads a value from the pointer at the specified index.
///
/// This is equivalent to the C operation `pointer[index]`.
///
/// Parameters:
/// - `index`: The index to read from
///
/// Returns the value at the specified index.
pub fn[T] Pointer::op_get(self : Pointer[T], index : UInt64) -> T {
  let array = move_into_array(self)
  let value = array.unsafe_get(index.to_int())
  ignore(take_from_array(array))
  value
}

///|
/// Writes a value to the pointer at the specified index.
///
/// This is equivalent to the C operation `pointer[index] = value`.
///
/// Parameters:
/// - `index`: The index to write to
/// - `value`: The value to write
pub fn[T] Pointer::op_set(self : Pointer[T], index : UInt64, value : T) -> Unit {
  let array = move_into_array(self)
  array.unsafe_set(index.to_int(), value)
  ignore(take_from_array(array))
}

///|
/// Loads a value from the memory location pointed to by this pointer.
///
/// This is equivalent to dereferencing the pointer in C (`*pointer`).
///
/// Returns the value stored at this memory location.
pub fn[T] Pointer::load(self : Pointer[T]) -> T {
  self[0]
}

///|
/// Stores a value to the memory location pointed to by this pointer.
///
/// This is equivalent to the C operation `*pointer = value`.
///
/// Parameters:
/// - `value`: The value to store
pub fn[T] Pointer::store(self : Pointer[T], value : T) -> Unit {
  self[0] = value
}

///|
extern "c" fn pointer_to_uint64(pointer : Pointer[Unit]) -> UInt64 = "moonbit_tonyfettes_c_pointer_to_uint64"

///|
/// Converts the pointer to a 64-bit unsigned integer.
///
/// This returns the numeric value of the pointer's address.
///
/// Returns the memory address as a `UInt64`.
pub fn[T] Pointer::to_uint64(self : Pointer[T]) -> UInt64 {
  pointer_to_uint64(self.cast())
}
