///|
fn init {
  ignore(@c.moonbit_ffi_make_closure)
}

///|
extern "c" fn malloc(size : UInt64) -> @c.Pointer[Unit] = "moonbit_c_malloc"

///|
extern "c" fn free(ptr : @c.Pointer[Unit]) = "free"

///|
fn main {
  try {
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
  } catch {
    _ => panic()
  }
}
