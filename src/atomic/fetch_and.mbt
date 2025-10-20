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
pub fn[T : FetchAdd] fetch_add(ptr : @c.Pointer[Atomic[T]], value : T) -> T {
  T::fetch_add(ptr, value)
}
