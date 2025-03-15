///|
type Size UInt64 derive(Eq, Hash)

///|
pub fn Size::op_get(self : Size, length : UInt64) -> Size = "%u64.mul"

///|
pub let byte : Size = 1

///|
pub let int16 : Size = 2

///|
pub let uint16 : Size = 2

///|
pub let int : Size = 4

///|
pub let uint : Size = 4

///|
pub let int64 : Size = 8

///|
pub let uint64 : Size = 8

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
pub impl Sized for Int16 with size() -> UInt64 {
  sizeof(int16)
}

///|
pub impl Sized for UInt16 with size() -> UInt64 {
  sizeof(uint16)
}

///|
pub impl Sized for Int with size() -> UInt64 {
  sizeof(int)
}

///|
pub impl Sized for UInt with size() -> UInt64 {
  sizeof(uint)
}

///|
pub impl Sized for Int64 with size() -> UInt64 {
  sizeof(int64)
}

///|
pub impl Sized for UInt64 with size() -> UInt64 {
  sizeof(uint64)
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
pub(open) trait ToInt {
  to_int(Self) -> Int
}

///|
pub impl ToInt for Int with to_int(self : Int) -> Int {
  self
}

///|
pub impl ToInt for UInt with to_int(self : UInt) -> Int {
  self.reinterpret_as_int()
}

///|
pub impl ToInt for UInt64 with to_int(self : UInt64) -> Int {
  self.to_int()
}
