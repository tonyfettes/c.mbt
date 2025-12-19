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
/// Unsafely extracts a pointer from any value.
///
/// **Warning**: This is an unsafe operation that should be used with extreme caution.
/// The value is not consumed, and using the pointer may lead to undefined behavior
/// if the value is moved or deallocated.
///
/// Parameters:
///
/// - `value`: The value to extract a pointer from
///
/// Returns a `Pointer[Unit]` pointing to the value's memory location.
#as_free_fn
pub fn[T] Pointer::unsafe_from(value : T) -> Pointer[Unit] = "%identity"

///|
/// Extracts a pointer from a reference.
///
/// Parameters:
///
/// - `value`: The reference to extract a pointer from
///
/// Returns a `Pointer[T]` pointing to the referenced value.
#as_free_fn
pub fn[T] Pointer::unsafe_from_ref(value : Ref[T]) -> Pointer[T] = "%identity"

///|
/// Extracts a pointer from a fixed array.
///
/// Parameters:
///
/// - `value`: The fixed array to extract a pointer from
///
/// Returns a `Pointer[T]` pointing to the first element of the array.
#as_free_fn
pub fn[T] Pointer::unsafe_from_array(value : FixedArray[T]) -> Pointer[T] = "%identity"

///|
/// Extracts a pointer from a bytes buffer.
///
/// Parameters:
///
/// - `value`: The bytes buffer to extract a pointer from
///
/// Returns a `Pointer[Byte]` pointing to the first byte of the buffer.
#as_free_fn
pub fn Pointer::unsafe_from_bytes(value : Bytes) -> Pointer[Byte] = "%identity"

///|
/// Unsafely converts a pointer back into a value.
///
/// **Warning**: This is an unsafe operation that should be used with extreme caution.
/// The pointer must point to valid memory of type `T`, or undefined behavior will occur.
///
/// Parameters:
///
/// - `pointer`: The pointer to convert
///
/// Returns a value of type `T`.
#as_free_fn
pub fn[T] Pointer::unsafe_into(ptr : Pointer[Unit]) -> T = "%identity"

///|
/// Converts a pointer into a reference.
///
/// Parameters:
///
/// - `pointer`: The pointer to convert
///
/// Returns a `Ref[T]` referencing the memory location.
#as_free_fn
pub fn[T] Pointer::unsafe_into_ref(ptr : Pointer[T]) -> Ref[T] = "%identity"

///|
/// Converts a pointer into a fixed array.
///
/// Parameters:
///
/// - `pointer`: The pointer to convert
///
/// Returns a `FixedArray[T]` starting at the pointer's memory location.
#as_free_fn
pub fn[T] Pointer::unsafe_into_array(ptr : Pointer[T]) -> FixedArray[T] = "%identity"

///|
/// Converts a pointer into a bytes buffer.
///
/// Parameters:
///
/// - `pointer`: The pointer to convert
///
/// Returns a `Bytes` buffer starting at the pointer's memory location.
#as_free_fn
pub fn Pointer::unsafe_into_bytes(ptr : Pointer[Byte]) -> Bytes = "%identity"

///|
/// Borrows a pointer from a reference for the duration of a function call.
///
/// The reference is temporarily converted to a pointer, passed to the function,
/// and then restored. This ensures the reference remains valid after the operation.
///
/// Parameters:
///
/// - `ref_`: The reference to borrow from
/// - `f`: The function to call with the borrowed pointer
///
/// Returns the result of calling `f`.
pub fn[T, R] borrow_ref(
  ref_ : Ref[T],
  f : (Pointer[T]) -> R raise?,
) -> R raise? {
  let ptr = unsafe_from_ref(ref_)
  let val : R = f(ptr)
  let _ : Ref[T] = unsafe_into_ref(ptr)
  val
}

///|
/// Borrows a pointer from a fixed array for the duration of a function call.
///
/// The array is temporarily converted to a pointer, passed to the function,
/// and then restored. This ensures the array remains valid after the operation.
///
/// Parameters:
///
/// - `array`: The fixed array to borrow from
/// - `f`: The function to call with the borrowed pointer
///
/// Returns the result of calling `f`.
pub fn[T, R] borrow_array(
  array : FixedArray[T],
  f : (Pointer[T]) -> R raise?,
) -> R raise? {
  let ptr = unsafe_from_array(array)
  let val : R = f(ptr)
  let _ : FixedArray[T] = unsafe_into_array(ptr)
  val
}

///|
/// Borrows a pointer from a bytes buffer for the duration of a function call.
///
/// The bytes buffer is temporarily converted to a pointer, passed to the function,
/// and then restored. This ensures the buffer remains valid after the operation.
///
/// Parameters:
///
/// - `bytes`: The bytes buffer to borrow from
/// - `f`: The function to call with the borrowed pointer
///
/// Returns the result of calling `f`.
pub fn[R] borrow_bytes(
  bytes : Bytes,
  f : (Pointer[Byte]) -> R raise?,
) -> R raise? {
  let ptr = unsafe_from_bytes(bytes)
  let val : R = f(ptr)
  let _ : Bytes = unsafe_into_bytes(ptr)
  val
}

///|
/// Unsafely borrows a pointer from any value for the duration of a function call.
///
/// **Warning**: This is an unsafe operation. The value is temporarily converted
/// to a pointer and restored after the function call, but this may lead to
/// undefined behavior if not used carefully.
///
/// Parameters:
///
/// - `value`: The value to borrow from
/// - `f`: The function to call with the borrowed pointer
///
/// Returns the result of calling `f`.
#locals(f)
pub fn[T, R] unsafe_borrow(
  value : T,
  f : (Pointer[Unit]) -> R raise?,
) -> R raise? {
  let ptr = unsafe_from(value)
  let val : R = for {
    break f(ptr)
  }
  let _ : T = unsafe_into(ptr)
  val
}

///|
/// Trait for types that support safe borrowing as pointers.
///
/// Types implementing this trait can be safely converted to and from pointers,
/// enabling temporary pointer access to their internal data.
trait Borrow {
  unsafe_from(Self) -> Pointer[Unit]
  unsafe_into(Pointer[Unit]) -> Self
}

///|
/// Borrows a pointer from a value that implements the `Borrow` trait.
///
/// The value is temporarily converted to a pointer, passed to the function,
/// and then restored. This ensures the value remains valid after the operation.
///
/// Parameters:
///
/// - `value`: The value to borrow from (must implement `Borrow`)
/// - `f`: The function to call with the borrowed pointer
///
/// Returns the result of calling `f`.
#locals(f)
pub fn[T : Borrow, R] borrow(
  value : T,
  f : (Pointer[Unit]) -> R raise?,
) -> R raise? {
  let ptr = T::unsafe_from(value)
  let val : R = for {
    break f(ptr)
  }
  let _ : T = T::unsafe_into(ptr)
  val
}

///|
pub fn[A : Borrow, B : Borrow, R] borrow_2(
  a : A,
  b : B,
  f : (Pointer[Unit], Pointer[Unit]) -> R raise?,
) -> R raise? {
  let ptr_a = A::unsafe_from(a)
  let ptr_b = B::unsafe_from(b)
  let val : R = for {
    break f(ptr_a, ptr_b)
  }
  let _ : A = A::unsafe_into(ptr_a)
  let _ : B = B::unsafe_into(ptr_b)
  val
}

///|
/// Implements `Borrow` for `Bytes` to extract a pointer.
pub impl Borrow for Bytes with unsafe_from(self : Bytes) -> Pointer[Unit] {
  unsafe_from_bytes(self).cast()
}

///|
/// Implements `Borrow` for `Bytes` to restore from a pointer.
pub impl Borrow for Bytes with unsafe_into(ptr : Pointer[Unit]) -> Bytes {
  unsafe_into_bytes(ptr.cast())
}

///|
/// Implements `Borrow` for `Pointer[T]` to cast to `Pointer[Unit]`.
pub impl[T] Borrow for Pointer[T] with unsafe_from(self : Pointer[T]) -> Pointer[
  Unit,
] {
  self.cast()
}

///|
/// Implements `Borrow` for `Pointer[T]` to cast from `Pointer[Unit]`.
pub impl[T] Borrow for Pointer[T] with unsafe_into(ptr : Pointer[Unit]) -> Pointer[
  T,
] {
  ptr.cast()
}

///|
/// Implements `Borrow` for `FixedArray[T]` to extract a pointer.
pub impl[T] Borrow for FixedArray[T] with unsafe_from(self : FixedArray[T]) -> Pointer[
  Unit,
] {
  unsafe_from_array(self).cast()
}

///|
/// Implements `Borrow` for `FixedArray[T]` to restore from a pointer.
pub impl[T] Borrow for FixedArray[T] with unsafe_into(ptr : Pointer[Unit]) -> FixedArray[
  T,
] {
  unsafe_into_array(ptr.cast())
}

///|
pub impl[T] Borrow for Ref[T] with unsafe_from(self : Ref[T]) -> Pointer[Unit] {
  unsafe_from_ref(self).cast()
}

///|
pub impl[T] Borrow for Ref[T] with unsafe_into(ptr : Pointer[Unit]) -> Ref[T] {
  unsafe_into_ref(ptr.cast())
}

///|
/// Decrements the reference count of a value.
///
/// This function manipulates the internal reference count by converting the value
/// to a pointer and back twice, effectively decrementing its reference count.
///
/// **Warning**: This is a low-level operation that should be used with caution.
///
/// Parameters:
///
/// - `value`: The value whose reference count should be decremented
pub fn[T] unsafe_decref(value : T) -> Unit {
  let pointer = unsafe_from(value)
  let _ : T = unsafe_into(pointer)
  let _ : T = unsafe_into(pointer)
  ()
}
