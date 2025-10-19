///|
extern "c" fn c_fwrite(
  ptr : @c.Pointer[Unit],
  size : UInt64,
  n : UInt64,
  stream : FILE,
) -> UInt64 = "fwrite"

///|
trait Fwrite {
  fwrite(self : Self, n : UInt64, stream : FILE) -> UInt64
}

///|
pub impl[T : @c.Sizeof] Fwrite for FixedArray[T] with fwrite(
  self : FixedArray[T],
  n : UInt64,
  stream : FILE,
) -> UInt64 {
  @c.borrow_array(self, ptr => c_fwrite(ptr.cast(), T::sizeof(), n, stream))
}

///|
pub impl[T : @c.Sizeof] Fwrite for @c.Pointer[T] with fwrite(
  ptr : @c.Pointer[T],
  n : UInt64,
  stream : FILE,
) -> UInt64 {
  return c_fwrite(ptr.cast(), T::sizeof(), n, stream)
}

///|
pub impl Fwrite for Bytes with fwrite(self : Bytes, n : UInt64, stream : FILE) -> UInt64 {
  @c.borrow_bytes(self, ptr => c_fwrite(ptr.cast(), 1, n, stream))
}

///|
pub fn[T : Fwrite] fwrite(ptr : T, n : UInt64, stream : FILE) -> UInt64 {
  Fwrite::fwrite(ptr, n, stream)
}
