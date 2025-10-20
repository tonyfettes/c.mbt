///|
pub(open) trait Exchange {
  exchange(ptr : @c.Pointer[Atomic[Self]], value : Self) -> Self = _
  exchange_explicit(
    ptr : @c.Pointer[Atomic[Self]],
    value : Self,
    order : MemoryOrder,
  ) -> Self
}

///|
impl Exchange with exchange(ptr : @c.Pointer[Atomic[Self]], value : Self) -> Self {
  Exchange::exchange_explicit(ptr, value, MemoryOrder::SeqCst)
}

///|
pub fn[T : Exchange] exchange(ptr : @c.Pointer[Atomic[T]], val : T) -> T {
  T::exchange(ptr, val)
}

///|
extern "c" fn atomic_exchange_explicit_int(
  object : @c.Pointer[Atomic[Int]],
  desired : Int,
  order : MemoryOrder,
) -> Int = "moonbit_tonyfettes_c_atomic_exchange_explicit_int"

///|
pub impl Exchange for Int with exchange_explicit(
  object : @c.Pointer[Atomic[Int]],
  desired : Int,
  order : MemoryOrder,
) -> Int {
  atomic_exchange_explicit_int(object, desired, order)
}
