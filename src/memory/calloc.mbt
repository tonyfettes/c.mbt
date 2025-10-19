///|
extern "c" fn memory_calloc(n : UInt64, size : UInt64) -> @c.Pointer[Unit] = "moonbit_tonyfettes_c_memory_calloc"

///|
pub fn[T : @c.Sizeof] calloc(
  n : UInt64,
  size? : UInt64 = T::sizeof(),
) -> @c.Pointer[T] {
  memory_calloc(n, size).cast()
}
