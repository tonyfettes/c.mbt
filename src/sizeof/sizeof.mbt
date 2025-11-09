///|
pub const Byte : UInt64 = 1

///|
pub const Int16 : UInt64 = 2

///|
pub const UInt16 : UInt64 = 2

///|
pub const Int : UInt64 = 4

///|
pub const UInt : UInt64 = 4

///|
pub const Int64 : UInt64 = 8

///|
pub const UInt64 : UInt64 = 8

///|
pub const Float : UInt64 = 4

///|
pub const Double : UInt64 = 8

///|
pub(open) trait Sizeof {
  sizeof() -> UInt64
}

///|
pub impl Sizeof for Byte with sizeof() -> UInt64 {
  1
}

///|
pub impl Sizeof for Int16 with sizeof() -> UInt64 {
  2
}

///|
pub impl Sizeof for UInt16 with sizeof() -> UInt64 {
  2
}

///|
pub impl Sizeof for Int with sizeof() -> UInt64 {
  4
}

///|
pub impl Sizeof for UInt with sizeof() -> UInt64 {
  4
}

///|
pub impl Sizeof for Int64 with sizeof() -> UInt64 {
  8
}

///|
pub impl Sizeof for UInt64 with sizeof() -> UInt64 {
  8
}

///|
pub impl Sizeof for Float with sizeof() -> UInt64 {
  4
}

///|
pub impl Sizeof for Double with sizeof() -> UInt64 {
  8
}

///|
pub fn[T : Sizeof] sizeof(_ : T) -> UInt64 {
  T::sizeof()
}
