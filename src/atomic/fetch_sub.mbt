///|
pub(open) trait FetchSub {
  fetch_sub(ptr : @c.Pointer[Atomic[Self]], value : Self) -> Self = _
  fetch_sub_explicit(
    ptr : @c.Pointer[Atomic[Self]],
    value : Self,
    order : MemoryOrder,
  ) -> Self
}

///|
impl FetchSub with fetch_sub(ptr : @c.Pointer[Atomic[Self]], value : Self) -> Self {
  FetchSub::fetch_sub_explicit(ptr, value, MemoryOrder::SeqCst)
}

///|
pub fn[T : FetchSub] fetch_sub(ptr : @c.Pointer[Atomic[T]], value : T) -> T {
  T::fetch_sub(ptr, value)
}

///|
extern "c" fn atomic_fetch_sub_explicit_int(
  object : @c.Pointer[Atomic[Int]],
  operand : Int,
  order : MemoryOrder,
) -> Int = "moonbit_tonyfettes_c_atomic_fetch_sub_explicit_int"

///|
pub impl FetchSub for Int with fetch_sub_explicit(
  object : @c.Pointer[Atomic[Int]],
  operand : Int,
  order : MemoryOrder,
) -> Int {
  atomic_fetch_sub_explicit_int(object, operand, order)
}
