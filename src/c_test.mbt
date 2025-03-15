///|
extern "c" fn malloc(size : UInt64) -> Pointer[Unit] = "moonbit_c_malloc"

///|
extern "c" fn free(ptr : Pointer[Unit]) = "free"

///|
test {
  let pointer : @c.Pointer[UInt64] = malloc(8).cast()
  pointer[0] = 42
  inspect!(pointer.load(), content="42")
  pointer[0] = pointer[0] + 1
  inspect!(pointer.load(), content="43")
  free(pointer.cast())
  let pointer : @c.Pointer[UInt64] = malloc(8).cast()
  pointer[0] = 42
  inspect!(pointer.load(), content="42")
  pointer[0] = pointer[0] + 1
  inspect!(pointer.load(), content="43")
  free(pointer.cast())
}
