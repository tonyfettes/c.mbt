///|
#external
pub type Pointer[_]

///|
fn[T] Pointer::to_array(self : Pointer[T]) -> FixedArray[T] = "%identity"

///|
pub fn[T, U] Pointer::cast(self : Pointer[T]) -> Pointer[U] = "%identity"

///|
extern "c" fn Pointer::_is_null(ptr : Pointer[Unit]) -> Bool = "moonbit_c_is_null"

///|
pub fn[T] is_null(self : Pointer[T]) -> Bool {
  self.cast()._is_null()
}

///|
extern "c" fn Pointer::_null() -> Pointer[Unit] = "moonbit_c_null"

///|
pub fn[T] Pointer::null() -> Pointer[T] {
  Pointer::_null().cast()
}

///|
pub fn[T] null() -> Pointer[T] {
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
fn[T] array_unsafe_get(array : FixedArray[T], index : Int) -> T = "%fixedarray.unsafe_get"

///|
fn[T] array_unsafe_set(array : FixedArray[T], index : Int, value : T) -> Unit = "%fixedarray.unsafe_set"

///|
fn[T] array_incref(ptr : FixedArray[T]) -> Unit = "%identity"

///|
pub fn[T : Load] Pointer::op_get(self : Pointer[T], index : Int) -> T {
  T::load(self, index)
}

///|
pub fn[T : Store] Pointer::op_set(
  self : Pointer[T],
  index : Int,
  value : T
) -> Unit {
  T::store(self, index, value)
}

///|
fn[T] Pointer::unsafe_load(self : Pointer[T], offset : Int) -> T {
  let array = self.to_array()
  let value = array_unsafe_get(array, offset)
  array_incref(array)
  value
}

///|
fn[T] Pointer::unsafe_store(self : Pointer[T], offset : Int, value : T) -> Unit {
  let array = self.to_array()
  array_unsafe_set(array, offset, value)
  array_incref(array)
}

///|
pub fn[T : Load] Pointer::load(self : Pointer[T], offset~ : Int = 0) -> T {
  T::load(self, offset)
}

///|
pub fn[T : Store] Pointer::store(
  self : Pointer[T],
  offset~ : Int = 0,
  value : T
) -> Unit {
  T::store(self, offset, value)
}

///|
pub(open) trait Load {
  load(Pointer[Self], Int) -> Self
}

///|
fn[T] Pointer::as_nullable(self : Pointer[T]) -> Nullable[T] = "%identity"

///|
pub impl Load for Byte with load(pointer : Pointer[Byte], offset : Int) -> Byte {
  pointer.unsafe_load(offset)
}

///|
pub impl Load for Int16 with load(pointer : Pointer[Int16], offset : Int) -> Int16 {
  pointer.unsafe_load(offset)
}

///|
pub impl Load for UInt16 with load(pointer : Pointer[UInt16], offset : Int) -> UInt16 {
  pointer.unsafe_load(offset)
}

///|
pub impl Load for Int with load(pointer : Pointer[Int], offset : Int) -> Int {
  pointer.unsafe_load(offset)
}

///|
pub impl Load for UInt with load(pointer : Pointer[UInt], offset : Int) -> UInt {
  pointer.unsafe_load(offset)
}

///|
pub impl Load for Int64 with load(pointer : Pointer[Int64], offset : Int) -> Int64 {
  pointer.unsafe_load(offset)
}

///|
pub impl Load for UInt64 with load(pointer : Pointer[UInt64], offset : Int) -> UInt64 {
  pointer.unsafe_load(offset)
}

///|
pub impl Load for Float with load(pointer : Pointer[Float], offset : Int) -> Float {
  pointer.unsafe_load(offset)
}

///|
pub impl Load for Double with load(pointer : Pointer[Double], offset : Int) -> Double {
  pointer.unsafe_load(offset)
}

///|
trait Store {
  store(Pointer[Self], Int, Self) -> Unit
}

///|
pub impl Store for Byte with store(
  pointer : Pointer[Byte],
  offset : Int,
  value : Byte
) -> Unit {
  pointer.unsafe_store(offset, value)
}

///|
pub impl Store for Int16 with store(
  pointer : Pointer[Int16],
  offset : Int,
  value : Int16
) -> Unit {
  pointer.unsafe_store(offset, value)
}

///|
pub impl Store for UInt16 with store(
  pointer : Pointer[UInt16],
  offset : Int,
  value : UInt16
) -> Unit {
  pointer.unsafe_store(offset, value)
}

///|
pub impl Store for Int with store(
  pointer : Pointer[Int],
  offset : Int,
  value : Int
) -> Unit {
  pointer.unsafe_store(offset, value)
}

///|
pub impl Store for UInt with store(
  pointer : Pointer[UInt],
  offset : Int,
  value : UInt
) -> Unit {
  pointer.unsafe_store(offset, value)
}

///|
pub impl Store for Int64 with store(
  pointer : Pointer[Int64],
  offset : Int,
  value : Int64
) -> Unit {
  pointer.unsafe_store(offset, value)
}

///|
pub impl Store for UInt64 with store(
  pointer : Pointer[UInt64],
  offset : Int,
  value : UInt64
) -> Unit {
  pointer.unsafe_store(offset, value)
}

///|
pub impl Store for Float with store(
  pointer : Pointer[Float],
  offset : Int,
  value : Float
) -> Unit {
  pointer.unsafe_store(offset, value)
}

///|
pub impl Store for Double with store(
  pointer : Pointer[Double],
  offset : Int,
  value : Double
) -> Unit {
  pointer.unsafe_store(offset, value)
}
