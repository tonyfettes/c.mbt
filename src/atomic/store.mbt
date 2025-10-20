///|
pub(open) trait Store {
  store(ptr : @c.Pointer[Atomic[Self]], value : Self) -> Unit = _
  store_explicit(
    ptr : @c.Pointer[Atomic[Self]],
    value : Self,
    order : MemoryOrder,
  ) -> Unit
}

///|
impl Store with store(ptr : @c.Pointer[Atomic[Self]], value : Self) -> Unit {
  Store::store_explicit(ptr, value, MemoryOrder::SeqCst)
}

///|
pub fn[T : Store] store(ptr : @c.Pointer[Atomic[T]], val : T) -> Unit {
  T::store(ptr, val)
}

///|
extern "c" fn atomic_store_explicit_int(
  object : @c.Pointer[Atomic[Int]],
  value : Int,
  order : MemoryOrder,
) = "moonbit_tonyfettes_c_atomic_store_explicit_int"

///|
pub impl Store for Int with store_explicit(
  ptr : @c.Pointer[Atomic[Int]],
  value : Int,
  order : MemoryOrder,
) -> Unit {
  atomic_store_explicit_int(ptr, value, order)
}
