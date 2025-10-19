///|
extern "c" fn memory_realloc(
  ptr : @c.Pointer[Unit],
  size : UInt64,
) -> @c.Pointer[Unit] = "moonbit_tonyfettes_c_memory_realloc"

///|
pub fn[T] realloc(ptr : @c.Pointer[T], size : UInt64) -> @c.Pointer[T] {
  memory_realloc(ptr.cast(), size).cast()
}
