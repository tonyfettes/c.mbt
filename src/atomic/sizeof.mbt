///|
extern "c" fn atomic_sizeof_int() -> UInt64 = "moonbit_tonyfettes_c_atomic_sizeof_int"

///|
pub(open) trait Sizeof {
  sizeof() -> UInt64
}

///|
pub impl Sizeof for Int with sizeof() -> UInt64 {
  atomic_sizeof_int()
}

///|
pub impl[T : Sizeof] @c.Sizeof for Atomic[T] with sizeof() -> UInt64 {
  T::sizeof()
}
