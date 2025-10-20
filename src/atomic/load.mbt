///|
pub(open) trait Load {
  load(ptr : @c.Pointer[Atomic[Self]]) -> Self = _
  load_explicit(ptr : @c.Pointer[Atomic[Self]], order : MemoryOrder) -> Self
}

///|
impl Load with load(ptr : @c.Pointer[Atomic[Self]]) -> Self {
  Load::load_explicit(ptr, MemoryOrder::SeqCst)
}

///|
pub fn[T : Load] load(ptr : @c.Pointer[Atomic[T]]) -> T {
  T::load(ptr)
}

///|
extern "c" fn atomic_load_explicit_int(
  object : @c.Pointer[Atomic[Int]],
  order : MemoryOrder,
) -> Int = "moonbit_tonyfettes_c_atomic_load_explicit_int"

///|
pub impl Load for Int with load_explicit(
  ptr : @c.Pointer[Atomic[Int]],
  order : MemoryOrder,
) -> Int {
  atomic_load_explicit_int(ptr, order)
}
