///|
fn init {
  ignore(@c.moonbit_ffi_make_closure)
}

///|
extern "c" fn malloc(size : UInt64) -> @c.Pointer[Unit] = "moonbit_c_malloc"

///|
extern "c" fn free(ptr : @c.Pointer[Unit]) = "free"

///|
priv type IntBytes Bytes derive(Show)

///|
impl @c.Sized for IntBytes with sizeof() -> Int {
  4
}

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
    let pointer : @c.Pointer[Int] = malloc(4).cast()
    pointer[0] = 42
    inspect!(pointer.load(), content="42")
    let pointer : @c.Pointer[IntBytes] = pointer.cast()
    inspect!(pointer.load(), content="42")
    free(pointer.cast())
  } catch {
    _ => panic()
  }
}
