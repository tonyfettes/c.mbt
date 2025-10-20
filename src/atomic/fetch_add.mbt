///|
pub(open) trait FetchAdd {
  fetch_add(ptr : @c.Pointer[Atomic[Self]], value : Self) -> Self = _
  fetch_add_explicit(
    ptr : @c.Pointer[Atomic[Self]],
    value : Self,
    order : MemoryOrder,
  ) -> Self
}

///|
impl FetchAdd with fetch_add(ptr : @c.Pointer[Atomic[Self]], value : Self) -> Self {
  FetchAdd::fetch_add_explicit(ptr, value, MemoryOrder::SeqCst)
}

///|
pub fn[T : FetchAdd] fetch_add(ptr : @c.Pointer[Atomic[T]], value : T) -> T {
  T::fetch_add(ptr, value)
}

///|
extern "c" fn atomic_fetch_add_explicit_int(
  object : @c.Pointer[Atomic[Int]],
  value : Int,
  order : MemoryOrder,
) -> Int = "moonbit_tonyfettes_c_atomic_fetch_add_explicit_int"

///|
pub impl FetchAdd for Int with fetch_add_explicit(
  ptr : @c.Pointer[Atomic[Int]],
  value : Int,
  order : MemoryOrder,
) -> Int {
  atomic_fetch_add_explicit_int(ptr, value, order)
}
