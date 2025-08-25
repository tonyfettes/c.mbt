///|
extern "c" fn c_malloc(size : UInt64) -> @c.Pointer[Unit] = "moonbit_c_malloc"

///|
pub fn[T] malloc(size : UInt64) -> @c.Pointer[T] {
  c_malloc(size).cast()
}

///|
extern "c" fn c_free(ptr : @c.Pointer[Unit]) = "free"

///|
pub fn[T] free(ptr : @c.Pointer[T]) -> Unit {
  c_free(ptr.cast())
}
