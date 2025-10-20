///|
pub(open) trait Init {
  init(ptr : @c.Pointer[Atomic[Self]], value : Self) -> Unit
}

///|
extern "c" fn atomic_init_int(ptr : @c.Pointer[Atomic[Int]], value : Int) = "moonbit_tonyfettes_c_atomic_init_int"

///|
pub impl Init for Int with init(ptr : @c.Pointer[Atomic[Int]], value : Int) -> Unit {
  atomic_init_int(ptr, value)
}

///|
pub fn[T : Init] init_(ptr : @c.Pointer[Atomic[T]], value : T) -> Unit {
  T::init(ptr, value)
}
