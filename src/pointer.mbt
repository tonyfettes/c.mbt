///|
extern type Pointer[_]

///|
pub fn Pointer::of_array[T](array : FixedArray[T]) -> Pointer[T] = "%identity"

///|
fn Pointer::to_array[T](self : Pointer[T]) -> FixedArray[T] = "%identity"

///|
pub fn Pointer::of_bytes(bytes : Bytes) -> Pointer[Byte] = "%identity"

///|
pub fn Pointer::cast[T, U](self : Pointer[T]) -> Pointer[U] = "%identity"

///|
extern "c" fn Pointer::_is_null(ptr : Pointer[Unit]) -> Bool = "moonbit_c_is_null"

///|
pub fn is_null[T](self : Pointer[T]) -> Bool {
  self.cast()._is_null()
}

///|
extern "c" fn Pointer::_null() -> Pointer[Unit] = "moonbit_c_null"

///|
pub fn Pointer::null[T]() -> Pointer[T] {
  Pointer::_null().cast()
}

///|
pub fn null[T]() -> Pointer[T] {
  Pointer::_null().cast()
}

///|
pub extern "c" fn Pointer::op_equal(
  self : Pointer[Unit],
  other : Pointer[Unit]
) -> Bool = "moonbit_c_pointer_equal"

///|
pub impl[T] Eq for Pointer[T] with op_equal(
  self : Pointer[T],
  other : Pointer[T]
) -> Bool {
  self.cast().op_equal(other.cast())
}

///|
fn array_unsafe_get[T](array : FixedArray[T], index : Int) -> T = "%fixedarray.unsafe_get"

///|
pub fn Pointer::op_get[T : Sized, I : ToInt](self : Pointer[T], index : I) -> T {
  let array = self.to_array()
  let value = array_unsafe_get(array, index.to_int())
  array_incref(array)
  value
}

///|
fn array_unsafe_set[T](array : FixedArray[T], index : Int, value : T) -> Unit = "%fixedarray.unsafe_set"

///|
fn array_incref[T](ptr : FixedArray[T]) -> Unit = "%identity"

///|
pub fn Pointer::op_set[T : Sized, I : ToInt](
  self : Pointer[T],
  index : I,
  value : T
) -> Unit {
  let array = self.to_array()
  array_unsafe_set(array, index.to_int(), value)
  array_incref(array)
}

///|
pub fn Pointer::load[T : Sized](self : Pointer[T]) -> T {
  self[0]
}

///|
pub fn Pointer::store[T : Sized](self : Pointer[T], value : T) -> Unit {
  self[0] = value
}
