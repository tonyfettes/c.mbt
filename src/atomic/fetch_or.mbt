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
