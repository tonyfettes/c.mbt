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
