///|
pub(open) trait CompareExchangeStrong {
  compare_exchange_strong(
    ptr : @c.Pointer[Atomic[Self]],
    expected : @c.Pointer[Self],
    desired : Self,
  ) -> Bool = _
  compare_exchange_strong_explicit(
    ptr : @c.Pointer[Atomic[Self]],
    expected : @c.Pointer[Self],
    desired : Self,
    success_order : MemoryOrder,
    failure_order : MemoryOrder,
  ) -> Bool
}

///|
impl CompareExchangeStrong with compare_exchange_strong(
  ptr : @c.Pointer[Atomic[Self]],
  expected : @c.Pointer[Self],
  desired : Self,
) -> Bool {
  CompareExchangeStrong::compare_exchange_strong_explicit(
    ptr,
    expected,
    desired,
    MemoryOrder::SeqCst,
    MemoryOrder::SeqCst,
  )
}

///|
pub(open) trait CompareExchangeWeak {
  compare_exchange_weak(
    ptr : @c.Pointer[Atomic[Self]],
    expected : @c.Pointer[Self],
    desired : Self,
  ) -> Bool = _
  compare_exchange_weak_explicit(
    ptr : @c.Pointer[Atomic[Self]],
    expected : @c.Pointer[Self],
    desired : Self,
    success_order : MemoryOrder,
    failure_order : MemoryOrder,
  ) -> Bool
}

///|
impl CompareExchangeWeak with compare_exchange_weak(
  ptr : @c.Pointer[Atomic[Self]],
  expected : @c.Pointer[Self],
  desired : Self,
) -> Bool {
  CompareExchangeWeak::compare_exchange_weak_explicit(
    ptr,
    expected,
    desired,
    MemoryOrder::SeqCst,
    MemoryOrder::SeqCst,
  )
}
