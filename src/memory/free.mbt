///|
extern "c" fn memory_free(ptr : @c.Pointer[Unit]) = "moonbit_tonyfettes_c_memory_free"

///|
pub fn[T] free(ptr : @c.Pointer[T]) -> Unit {
  memory_free(ptr.cast())
}
