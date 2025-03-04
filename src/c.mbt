///|
extern type Ptr[_]

///|
pub fn Ptr::of_memory[T](memory : @memory.Memory[T]) -> Ptr[T] = "%identity"

///|
extern "c" fn ptr_to_uint64(ptr : Ptr[Unit]) -> UInt64 = "moonbit_c_ptr_to_uint64"

///|
extern "c" fn ptr_of_uint64(value : UInt64) -> Ptr[Unit] = "moonbit_c_ptr_of_uint64"

///|
fn identity[T, U](value : T) -> U = "%identity"

///|
pub fn Ptr::cast[T, U](self : Ptr[T]) -> Ptr[U] = "%identity"

///|
pub fn Ptr::to_uint64[T](ptr : Ptr[T]) -> UInt64 {
  ptr_to_uint64(identity(ptr))
}

///|
pub fn Ptr::of_uint64[T](address : UInt64) -> Ptr[T] {
  ptr_of_uint64(address) |> identity()
}

///|
pub fn Ptr::add[T : Sized](self : Ptr[T], offset : UInt64) -> Ptr[T] {
  let address = self.to_uint64() + offset * T::size()
  Ptr::of_uint64(address)
}

///|
extern "c" fn _is_null(ptr : Ptr[Unit]) -> Bool = "moonbit_c_is_null"

///|
pub fn is_null[T](self : Ptr[T]) -> Bool {
  _is_null(identity(self))
}

///|
pub fn null[T]() -> Ptr[T] {
  identity(0)
}

///|
trait Load {
  load(Ptr[Self]) -> Self
}

///|
extern "c" fn load_byte(self : Ptr[Byte]) -> Byte = "moonbit_c_load_char"

///|
extern "c" fn load_int(self : Ptr[Int]) -> Int = "moonbit_c_load_int"

///|
extern "c" fn load_float(ptr : Ptr[Float]) -> Float = "moonbit_c_load_float"

///|
extern "c" fn load_double(ptr : Ptr[Double]) -> Double = "moonbit_c_load_double"

///|
pub impl Load for Byte with load(ptr : Ptr[Byte]) -> Byte {
  ptr.load_byte()
}

///|
pub impl Load for Int with load(ptr : Ptr[Int]) -> Int {
  ptr.load_int()
}

///|
pub impl Load for Float with load(ptr : Ptr[Float]) -> Float {
  load_float(ptr)
}

///|
pub impl Load for Double with load(ptr : Ptr[Double]) -> Double {
  load_double(ptr)
}

///|
pub fn Ptr::load[T : Load](self : Ptr[T]) -> T {
  T::load(self)
}

///|
trait Store {
  store(Ptr[Self], Self) -> Unit
}

///|
extern "c" fn store_byte(ptr : Ptr[Byte], value : Byte) -> Unit = "moonbit_c_store_char"

///|
extern "c" fn store_int(ptr : Ptr[Int], value : Int) -> Unit = "moonbit_c_store_int"

///|
extern "c" fn store_float(ptr : Ptr[Float], value : Float) -> Unit = "moonbit_c_store_int"

///|
extern "c" fn store_double(ptr : Ptr[Double], value : Double) -> Unit = "moonbit_c_store_double"

///|
pub impl Store for Byte with store(ptr : Ptr[Byte], value : Byte) -> Unit {
  store_byte(ptr, value)
}

///|
pub impl Store for Int with store(ptr : Ptr[Int], value : Int) -> Unit {
  store_int(ptr, value)
}

///|
pub impl Store for Float with store(ptr : Ptr[Float], value : Float) -> Unit {
  store_float(ptr, value)
}

///|
pub impl Store for Double with store(ptr : Ptr[Double], value : Double) -> Unit {
  store_double(ptr, value)
}

///|
pub fn Ptr::store[T : Store](self : Ptr[T], value : T) -> Unit {
  T::store(self, value)
}

///|
type Size UInt64 derive(Eq, Hash)

///|
pub fn Size::op_get(self : Size, length : UInt64) -> Size = "%u64.mul"

///|
pub let byte : Size = 1

///|
pub let int : Size = 4

///|
pub let float : Size = 4

///|
pub let double : Size = 8

///|
pub fn sizeof(type_ : Size) -> UInt64 = "%identity"

///|
pub(open) trait Sized {
  size() -> UInt64
}

///|
pub impl Sized for Byte with size() -> UInt64 {
  sizeof(byte)
}

///|
pub impl Sized for Int with size() -> UInt64 {
  sizeof(int)
}

///|
pub impl Sized for Float with size() -> UInt64 {
  sizeof(float)
}

///|
pub impl Sized for Double with size() -> UInt64 {
  sizeof(double)
}

///|
trait ToUInt64 {
  to_uint64(Self) -> UInt64
}

///|
pub impl ToUInt64 for UInt64 with to_uint64(self : UInt64) -> UInt64 {
  self
}

///|
pub impl ToUInt64 for Int with to_uint64(self : Int) -> UInt64 {
  self.to_uint64()
}

///|
pub fn Ptr::op_get[T : Sized + Load, I : ToUInt64](
  self : Ptr[T],
  index : I
) -> T {
  self.add(index.to_uint64()).load()
}

///|
pub fn op_set[T : Sized + Store, I : ToUInt64](
  self : Ptr[T],
  index : I,
  value : T
) -> Unit {
  self.add(index.to_uint64()).store(value)
}
