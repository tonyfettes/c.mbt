///|
pub(open) trait FetchOr {
  fetch_or(ptr : @c.Pointer[Atomic[Self]], value : Self) -> Self = _
  fetch_or_explicit(
    ptr : @c.Pointer[Atomic[Self]],
    value : Self,
    order : MemoryOrder,
  ) -> Self
}

///|
impl FetchOr with fetch_or(ptr : @c.Pointer[Atomic[Self]], value : Self) -> Self {
  FetchOr::fetch_or_explicit(ptr, value, MemoryOrder::SeqCst)
}

///|
pub fn[T : FetchOr] fetch_or(ptr : @c.Pointer[Atomic[T]], value : T) -> T {
  T::fetch_or(ptr, value)
}

///|
extern "c" fn atomic_fetch_or_explicit_int(
  object : @c.Pointer[Atomic[Int]],
  operand : Int,
  order : MemoryOrder,
) -> Int = "moonbit_tonyfettes_c_atomic_fetch_or_explicit_int"

///|
pub impl FetchOr for Int with fetch_or_explicit(
  object : @c.Pointer[Atomic[Int]],
  operand : Int,
  order : MemoryOrder,
) -> Int {
  atomic_fetch_or_explicit_int(object, operand, order)
}
