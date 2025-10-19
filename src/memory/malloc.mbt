///|
extern "c" fn memory_malloc(size : UInt64) -> @c.Pointer[Unit] = "moonbit_tonyfettes_c_memory_malloc"

///|
pub fn[T] malloc(size : UInt64) -> @c.Pointer[T] {
  memory_malloc(size).cast()
}
