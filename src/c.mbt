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
pub impl ToUInt64 for Int64 with to_uint64(self : Int64) -> UInt64 {
  self.reinterpret_as_uint64()
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
pub fn Pointer::op_get[T : Sized + Load, I : ToUInt64](
  self : Pointer[T],
  index : I
) -> T {
  self.add(index.to_uint64()).load()
}

///|
pub fn op_set[T : Sized + Store, I : ToUInt64](
  self : Pointer[T],
  index : I,
  value : T
) -> Unit {
  self.add(index.to_uint64()).store(value)
}
