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
