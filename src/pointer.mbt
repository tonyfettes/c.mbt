///|
extern type Pointer[_]

///|
pub fn Pointer::of_array[T](array : FixedArray[T]) -> Pointer[T] = "%identity"

///|
pub fn Pointer::of_bytes(bytes : Bytes) -> Pointer[Byte] = "%identity"

///|
trait Memory {
  pointer(Self) -> Pointer[Unit]
  length(Self) -> UInt64
  sizeof(Self) -> UInt64
}

///|
pub impl[T : Sized] Memory for FixedArray[T] with pointer(self : FixedArray[T]) -> Pointer[
  Unit,
] {
  Pointer::of_array(self).cast()
}

///|
pub impl[T : Sized] Memory for FixedArray[T] with sizeof(self : FixedArray[T]) -> UInt64 {
  ignore(self)
  T::size()
}

///|
pub impl[T : Sized] Memory for FixedArray[T] with length(self : FixedArray[T]) -> UInt64 {
  self.length().to_uint64()
}

///|
pub impl Memory for Bytes with pointer(self : Bytes) -> Pointer[Unit] {
  Pointer::of_bytes(self).cast()
}

///|
pub impl Memory for Bytes with sizeof(self : Bytes) -> UInt64 {
  ignore(self)
  Byte::size()
}

///|
pub impl Memory for Bytes with length(self : Bytes) -> UInt64 {
  self.length().to_uint64()
}

///|
extern "c" fn ptr_to_uint64(ptr : Pointer[Unit]) -> UInt64 = "moonbit_c_ptr_to_uint64"

///|
extern "c" fn ptr_of_uint64(value : UInt64) -> Pointer[Unit] = "moonbit_c_ptr_of_uint64"

///|
fn identity[T, U](value : T) -> U = "%identity"

///|
pub fn Pointer::cast[T, U](self : Pointer[T]) -> Pointer[U] = "%identity"

///|
pub fn Pointer::to_uint64[T](ptr : Pointer[T]) -> UInt64 {
  ptr_to_uint64(identity(ptr))
}

///|
pub fn Pointer::of_uint64[T](address : UInt64) -> Pointer[T] {
  ptr_of_uint64(address) |> identity()
}

///|
pub fn Pointer::add[T : Sized](
  self : Pointer[T],
  offset : UInt64
) -> Pointer[T] {
  let address = self.to_uint64() + offset * T::size()
  Pointer::of_uint64(address)
}

///|
extern "c" fn _is_null(ptr : Pointer[Unit]) -> Bool = "moonbit_c_is_null"

///|
pub fn is_null[T](self : Pointer[T]) -> Bool {
  _is_null(identity(self))
}

///|
pub fn null[T]() -> Pointer[T] {
  identity(0)
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
trait Load {
  load(Pointer[Self]) -> Self
}

///|
extern "c" fn load_byte(self : Pointer[Byte]) -> Byte = "moonbit_c_load_char"

///|
extern "c" fn load_int(self : Pointer[Int]) -> Int = "moonbit_c_load_int"

///|
extern "c" fn load_float(ptr : Pointer[Float]) -> Float = "moonbit_c_load_float"

///|
extern "c" fn load_double(ptr : Pointer[Double]) -> Double = "moonbit_c_load_double"

///|
pub impl Load for Byte with load(ptr : Pointer[Byte]) -> Byte {
  ptr.load_byte()
}

///|
pub impl Load for Int with load(ptr : Pointer[Int]) -> Int {
  ptr.load_int()
}

///|
pub impl Load for Float with load(ptr : Pointer[Float]) -> Float {
  load_float(ptr)
}

///|
pub impl Load for Double with load(ptr : Pointer[Double]) -> Double {
  load_double(ptr)
}

///|
pub fn Pointer::load[T : Load](self : Pointer[T]) -> T {
  T::load(self)
}

///|
trait Store {
  store(Pointer[Self], Self) -> Unit
}

///|
extern "c" fn store_byte(ptr : Pointer[Byte], value : Byte) -> Unit = "moonbit_c_store_char"

///|
extern "c" fn store_int(ptr : Pointer[Int], value : Int) -> Unit = "moonbit_c_store_int"

///|
extern "c" fn store_float(ptr : Pointer[Float], value : Float) -> Unit = "moonbit_c_store_int"

///|
extern "c" fn store_double(ptr : Pointer[Double], value : Double) -> Unit = "moonbit_c_store_double"

///|
pub impl Store for Byte with store(ptr : Pointer[Byte], value : Byte) -> Unit {
  store_byte(ptr, value)
}

///|
pub impl Store for Int with store(ptr : Pointer[Int], value : Int) -> Unit {
  store_int(ptr, value)
}

///|
pub impl Store for Float with store(ptr : Pointer[Float], value : Float) -> Unit {
  store_float(ptr, value)
}

///|
pub impl Store for Double with store(ptr : Pointer[Double], value : Double) -> Unit {
  store_double(ptr, value)
}

///|
pub fn Pointer::store[T : Store](self : Pointer[T], value : T) -> Unit {
  T::store(self, value)
}
