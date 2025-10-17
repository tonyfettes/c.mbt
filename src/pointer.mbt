///|
#external
pub type Pointer[_]

///|
pub typealias Pointer as Ptr

///|
pub fn[T, U] Pointer::cast(self : Pointer[T]) -> Pointer[U] = "%identity"

///|
extern "c" fn pointer_is_null(ptr : Pointer[Unit]) -> Bool = "moonbit_c_is_null"

///|
extern "c" fn pointer_add(
  ptr : Pointer[Byte],
  offset : UInt64,
) -> Pointer[Byte] = "moonbit_c_pointer_add"

///|
pub fn[T : Size] Pointer::add(self : Pointer[T], offset : UInt64) -> Pointer[T] {
  pointer_add(self.cast(), offset * T::size()).cast()
}

///|
extern "c" fn pointer_sub(
  upper : Pointer[Byte],
  lower : Pointer[Byte],
) -> UInt64 = "moonbit_c_pointer_sub"

///|
pub fn[T : Size] Pointer::sub(self : Pointer[T], other : Pointer[T]) -> UInt64 {
  pointer_sub(self.cast(), other.cast()) / T::size()
}

///|
pub fn[T] Pointer::is_null(self : Pointer[T]) -> Bool {
  pointer_is_null(self.cast())
}

///|
extern "c" fn pointer_null() -> Pointer[Unit] = "moonbit_c_null"

///|
pub fn[T] Pointer::null() -> Pointer[T] {
  pointer_null().cast()
}

///|
extern "c" fn pointer_equal(
  self : Pointer[Unit],
  other : Pointer[Unit],
) -> Bool = "moonbit_c_pointer_equal"

///|
pub impl[T] Eq for Pointer[T] with equal(self : Pointer[T], other : Pointer[T]) -> Bool {
  self.cast().pointer_equal(other.cast())
}

///|
extern "c" fn pointer_compare(
  self : Pointer[Unit],
  other : Pointer[Unit],
) -> Int = "moonbit_c_pointer_compare"

///|
pub impl[T] Compare for Pointer[T] with compare(
  self : Pointer[T],
  other : Pointer[T],
) -> Int {
  self.cast().pointer_compare(other.cast())
}

///|
pub fn[T : Load + Size] Pointer::op_get(self : Pointer[T], index : UInt64) -> T {
  T::load(self.add(index))
}

///|
pub fn[T : Store + Size] Pointer::op_set(
  self : Pointer[T],
  index : UInt64,
  value : T,
) -> Unit {
  T::store(self.add(index), value)
}

///|
pub fn[T : Load] Pointer::load(self : Pointer[T]) -> T {
  T::load(self)
}

///|
pub fn[T : Store] Pointer::store(self : Pointer[T], value : T) -> Unit {
  T::store(self, value)
}

///|
pub(open) trait Size {
  size() -> UInt64
}

///|
pub impl Size for Byte with size() -> UInt64 {
  1
}

///|
pub impl Size for Int16 with size() -> UInt64 {
  2
}

///|
pub impl Size for UInt16 with size() -> UInt64 {
  2
}

///|
pub impl Size for Int with size() -> UInt64 {
  4
}

///|
pub impl Size for UInt with size() -> UInt64 {
  4
}

///|
pub impl Size for Int64 with size() -> UInt64 {
  8
}

///|
pub impl Size for UInt64 with size() -> UInt64 {
  8
}

///|
pub impl Size for Float with size() -> UInt64 {
  4
}

///|
pub impl Size for Double with size() -> UInt64 {
  8
}

///|
extern "c" fn moonbit_c_sizeof_pointer() -> UInt64 = "moonbit_c_sizeof_pointer"

///|
pub impl[T] Size for Pointer[T] with size() -> UInt64 {
  moonbit_c_sizeof_pointer()
}

///|
pub(open) trait Load {
  load(Pointer[Self]) -> Self
}

///|
extern "c" fn moonbit_c_load_byte(pointer : Pointer[Byte]) -> Byte = "moonbit_c_load_byte"

///|
extern "c" fn moonbit_c_load_int16(pointer : Pointer[Int16]) -> Int16 = "moonbit_c_load_int16"

///|
extern "c" fn moonbit_c_load_uint16(pointer : Pointer[UInt16]) -> UInt16 = "moonbit_c_load_uint16"

///|
extern "c" fn moonbit_c_load_int(pointer : Pointer[Int]) -> Int = "moonbit_c_load_int"

///|
extern "c" fn moonbit_c_load_uint(pointer : Pointer[UInt]) -> UInt = "moonbit_c_load_uint"

///|
extern "c" fn moonbit_c_load_int64(pointer : Pointer[Int64]) -> Int64 = "moonbit_c_load_int64"

///|
extern "c" fn moonbit_c_load_uint64(pointer : Pointer[UInt64]) -> UInt64 = "moonbit_c_load_uint64"

///|
extern "c" fn moonbit_c_load_float(pointer : Pointer[Float]) -> Float = "moonbit_c_load_float"

///|
extern "c" fn moonbit_c_load_double(pointer : Pointer[Double]) -> Double = "moonbit_c_load_double"

///|
pub impl Load for Byte with load(pointer : Pointer[Byte]) -> Byte {
  moonbit_c_load_byte(pointer)
}

///|
pub impl Load for Int16 with load(pointer : Pointer[Int16]) -> Int16 {
  moonbit_c_load_int16(pointer)
}

///|
pub impl Load for UInt16 with load(pointer : Pointer[UInt16]) -> UInt16 {
  moonbit_c_load_uint16(pointer)
}

///|
pub impl Load for Int with load(pointer : Pointer[Int]) -> Int {
  moonbit_c_load_int(pointer)
}

///|
pub impl Load for UInt with load(pointer : Pointer[UInt]) -> UInt {
  moonbit_c_load_uint(pointer)
}

///|
pub impl Load for Int64 with load(pointer : Pointer[Int64]) -> Int64 {
  moonbit_c_load_int64(pointer)
}

///|
pub impl Load for UInt64 with load(pointer : Pointer[UInt64]) -> UInt64 {
  moonbit_c_load_uint64(pointer)
}

///|
pub impl Load for Float with load(pointer : Pointer[Float]) -> Float {
  moonbit_c_load_float(pointer)
}

///|
pub impl Load for Double with load(pointer : Pointer[Double]) -> Double {
  moonbit_c_load_double(pointer)
}

///|
extern "c" fn moonbit_c_store_byte(
  pointer : Pointer[Byte],
  value : Byte,
) -> Unit = "moonbit_c_store_byte"

///|
extern "c" fn moonbit_c_store_int16(
  pointer : Pointer[Int16],
  value : Int16,
) -> Unit = "moonbit_c_store_int16"

///|
extern "c" fn moonbit_c_store_uint16(
  pointer : Pointer[UInt16],
  value : UInt16,
) -> Unit = "moonbit_c_store_uint16"

///|
extern "c" fn moonbit_c_store_int(pointer : Pointer[Int], value : Int) -> Unit = "moonbit_c_store_int"

///|
extern "c" fn moonbit_c_store_uint(
  pointer : Pointer[UInt],
  value : UInt,
) -> Unit = "moonbit_c_store_uint"

///|
extern "c" fn moonbit_c_store_int64(
  pointer : Pointer[Int64],
  value : Int64,
) -> Unit = "moonbit_c_store_int64"

///|
extern "c" fn moonbit_c_store_uint64(
  pointer : Pointer[UInt64],
  value : UInt64,
) -> Unit = "moonbit_c_store_uint64"

///|
extern "c" fn moonbit_c_store_float(
  pointer : Pointer[Float],
  value : Float,
) -> Unit = "moonbit_c_store_float"

///|
extern "c" fn moonbit_c_store_double(
  pointer : Pointer[Double],
  value : Double,
) -> Unit = "moonbit_c_store_double"

///|
trait Store {
  store(Pointer[Self], Self) -> Unit
}

///|
pub impl Store for Byte with store(pointer : Pointer[Byte], value : Byte) -> Unit {
  moonbit_c_store_byte(pointer, value)
}

///|
pub impl Store for Int16 with store(pointer : Pointer[Int16], value : Int16) -> Unit {
  moonbit_c_store_int16(pointer, value)
}

///|
pub impl Store for UInt16 with store(pointer : Pointer[UInt16], value : UInt16) -> Unit {
  moonbit_c_store_uint16(pointer, value)
}

///|
pub impl Store for Int with store(pointer : Pointer[Int], value : Int) -> Unit {
  moonbit_c_store_int(pointer, value)
}

///|
pub impl Store for UInt with store(pointer : Pointer[UInt], value : UInt) -> Unit {
  moonbit_c_store_uint(pointer, value)
}

///|
pub impl Store for Int64 with store(pointer : Pointer[Int64], value : Int64) -> Unit {
  moonbit_c_store_int64(pointer, value)
}

///|
pub impl Store for UInt64 with store(pointer : Pointer[UInt64], value : UInt64) -> Unit {
  moonbit_c_store_uint64(pointer, value)
}

///|
pub impl Store for Float with store(pointer : Pointer[Float], value : Float) -> Unit {
  moonbit_c_store_float(pointer, value)
}

///|
pub impl Store for Double with store(pointer : Pointer[Double], value : Double) -> Unit {
  moonbit_c_store_double(pointer, value)
}
