///|
extern "c" fn c_fread(
  ptr : @c.Pointer[Unit],
  size : UInt64,
  n : UInt64,
  stream : FILE,
) -> UInt64 = "fread"

///|
trait Fread {
  fread(self : Self, n : UInt64, stream : FILE) -> UInt64
}

///|
pub impl[T : @c.Sizeof] Fread for FixedArray[T] with fread(
  self : FixedArray[T],
  n : UInt64,
  stream : FILE,
) -> UInt64 {
  @c.borrow_array(self, ptr => c_fread(ptr.cast(), T::sizeof(), n, stream))
}

///|
pub impl[T : @c.Sizeof] Fread for @c.Pointer[T] with fread(
  ptr : @c.Pointer[T],
  n : UInt64,
  stream : FILE,
) -> UInt64 {
  c_fread(ptr.cast(), T::sizeof(), n, stream)
}

///|
pub fn[T : Fread] fread(ptr : T, n : UInt64, stream : FILE) -> UInt64 {
  Fread::fread(ptr, n, stream)
}
