///|
pub(open) trait FetchAnd {
  fetch_and(ptr : @c.Pointer[Atomic[Self]], value : Self) -> Self = _
  fetch_and_explicit(
    ptr : @c.Pointer[Atomic[Self]],
    value : Self,
    order : MemoryOrder,
  ) -> Self
}

///|
impl FetchAnd with fetch_and(ptr : @c.Pointer[Atomic[Self]], value : Self) -> Self {
  FetchAnd::fetch_and_explicit(ptr, value, MemoryOrder::SeqCst)
}

///|
pub fn[T : FetchAnd] fetch_and(ptr : @c.Pointer[Atomic[T]], value : T) -> T {
  T::fetch_and(ptr, value)
}

///|
extern "c" fn atomic_fetch_and_explicit_int(
  object : @c.Pointer[Atomic[Int]],
  operand : Int,
  order : MemoryOrder,
) -> Int = "moonbit_tonyfettes_c_atomic_fetch_and_explicit_int"

///|
pub impl FetchAnd for Int with fetch_and_explicit(
  object : @c.Pointer[Atomic[Int]],
  operand : Int,
  order : MemoryOrder,
) -> Int {
  atomic_fetch_and_explicit_int(object, operand, order)
}
