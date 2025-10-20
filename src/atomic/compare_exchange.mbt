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
pub fn[T : CompareExchangeStrong] compare_exchange_strong(
  object : @c.Pointer[Atomic[T]],
  expected : @c.Pointer[T],
  desired : T,
) -> Bool {
  CompareExchangeStrong::compare_exchange_strong(object, expected, desired)
}

///|
extern "c" fn atomic_compare_exchange_strong_explicit_int(
  object : @c.Pointer[Atomic[Int]],
  expected : @c.Pointer[Int],
  desired : Int,
  success : MemoryOrder,
  failure : MemoryOrder,
) -> Int = "moonbit_tonyfettes_c_atomic_compare_exchange_strong_explicit_int"

///|
pub impl CompareExchangeStrong for Int with compare_exchange_strong_explicit(
  object : @c.Pointer[Atomic[Int]],
  expected : @c.Pointer[Int],
  desired : Int,
  success : MemoryOrder,
  failure : MemoryOrder,
) -> Bool {
  atomic_compare_exchange_strong_explicit_int(
    object, expected, desired, success, failure,
  ) !=
  0
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

///|
pub fn[T : CompareExchangeWeak] compare_exchange_weak(
  object : @c.Pointer[Atomic[T]],
  expected : @c.Pointer[T],
  desired : T,
) -> Bool {
  CompareExchangeWeak::compare_exchange_weak(object, expected, desired)
}

///|
extern "c" fn atomic_compare_exchange_weak_explicit_int(
  object : @c.Pointer[Atomic[Int]],
  expected : @c.Pointer[Int],
  desired : Int,
  success : MemoryOrder,
  failure : MemoryOrder,
) -> Int = "moonbit_tonyfettes_c_atomic_compare_exchange_weak_explicit_int"

///|
pub impl CompareExchangeWeak for Int with compare_exchange_weak_explicit(
  object : @c.Pointer[Atomic[Int]],
  expected : @c.Pointer[Int],
  desired : Int,
  success : MemoryOrder,
  failure : MemoryOrder,
) -> Bool {
  atomic_compare_exchange_weak_explicit_int(
    object, expected, desired, success, failure,
  ) !=
  0
}
