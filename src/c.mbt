///|
type Ptr[_]

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
trait Deref {
  deref(Ptr[Self]) -> Self
}

///|
extern "c" fn deref_int(ptr : Ptr[Int]) -> Int = "moonbit_c_deref_int"

///|
pub impl Deref for Int with deref(ptr : Ptr[Int]) -> Int { deref_int(ptr) }

///|
extern "c" fn deref_float(ptr : Ptr[Float]) -> Float = "moonbit_c_deref_float"

///|
pub impl Deref for Float with deref(ptr : Ptr[Float]) -> Float {
  deref_float(ptr)
}

///|
pub fn Ptr::deref[T : Deref](self : Ptr[T]) -> T {
  T::deref(self)
}

///|
trait Write {
  write(Ptr[Self], Self) -> Unit
}

///|
extern "c" fn write_int(ptr : Ptr[Int], value : Int) -> Unit = "moonbit_c_write_int"

///|
pub impl Write for Int with write(ptr : Ptr[Int], value : Int) -> Unit {
  write_int(ptr, value)
}

///|
extern "c" fn write_float(ptr : Ptr[Float], value : Float) -> Unit = "moonbit_c_write_int"

///|
impl Write for Float with write(ptr : Ptr[Float], value : Float) -> Unit {
  write_float(ptr, value)
}

///|
pub fn Ptr::write[T : Write](self : Ptr[T], value : T) -> Unit {
  T::write(self, value)
}

///|
type Type UInt64 derive(Eq, Hash)

///|
pub fn Type::op_get(self : Type, length : UInt64) -> Type = "%u64.mul"

///|
pub let int : Type = 4

///|
pub let float : Type = 4

///|
pub fn sizeof(type_ : Type) -> UInt64 = "%identity"

///|
pub(open) trait Sized {
  size() -> UInt64
}

///|
pub impl Sized for Int with size() -> UInt64 { sizeof(int) }

///|
pub impl Sized for Float with size() -> UInt64 { sizeof(float) }

///|
pub(open) trait ToUInt64 {
  to_uint64(Self) -> UInt64
}

///|
pub fn Ptr::op_get[T : Sized + Deref, I : ToUInt64](
  self : Ptr[T],
  index : I
) -> T {
  self.add(index.to_uint64()).deref()
}

///|
pub fn op_set[T : Sized + Write, I : ToUInt64](
  self : Ptr[T],
  index : I,
  value : T
) -> Unit {
  self.add(index.to_uint64()).write(value)
}
