///|
#external
pub type Atomic[_]

///|
extern "c" fn atomic_sizeof_int() -> UInt64 = "moonbit_tonyfettes_c_atomic_sizeof_int"

///|
pub(open) trait Sizeof {
  sizeof() -> UInt64
}

///|
pub impl Sizeof for Int with sizeof() -> UInt64 {
  atomic_sizeof_int()
}

///|
pub impl[T : Sizeof] @c.Sizeof for Atomic[T] with sizeof() -> UInt64 {
  T::sizeof()
}

///|
pub(open) trait Init {
  init(ptr : @c.Pointer[Atomic[Self]], value : Self) -> Unit
}

///|
extern "c" fn atomic_init_int(ptr : @c.Pointer[Atomic[Int]], value : Int) = "moonbit_tonyfettes_c_atomic_init_int"

///|
pub impl Init for Int with init(ptr : @c.Pointer[Atomic[Int]], value : Int) -> Unit {
  atomic_init_int(ptr, value)
}

///|
pub fn[T : Init] init_(ptr : @c.Pointer[Atomic[T]], value : T) -> Unit {
  T::init(ptr, value)
}

///|
pub(all) enum MemoryOrder {
  Relaxed = 0
  Consume = 1
  Acquire = 2
  Release = 3
  AcqRel = 4
  SeqCst = 5
}

///|
pub(open) trait Load {
  load(ptr : @c.Pointer[Atomic[Self]]) -> Self = _
  load_explicit(ptr : @c.Pointer[Atomic[Self]], order : MemoryOrder) -> Self
}

///|
impl Load with load(ptr : @c.Pointer[Atomic[Self]]) -> Self {
  Load::load_explicit(ptr, MemoryOrder::SeqCst)
}

///|
extern "c" fn atomic_load_explicit_int(
  object : @c.Pointer[Atomic[Int]],
  order : MemoryOrder,
) -> Int = "moonbit_tonyfettes_c_atomic_load_explicit_int"

///|
pub impl Load for Int with load_explicit(
  ptr : @c.Pointer[Atomic[Int]],
  order : MemoryOrder,
) -> Int {
  atomic_load_explicit_int(ptr, order)
}

///|
pub fn[T : Load] load(ptr : @c.Pointer[Atomic[T]]) -> T {
  T::load(ptr)
}

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

///|
pub(open) trait FetchAdd {
  fetch_add(ptr : @c.Pointer[Atomic[Self]], value : Self) -> Self = _
  fetch_add_explicit(
    ptr : @c.Pointer[Atomic[Self]],
    value : Self,
    order : MemoryOrder,
  ) -> Self
}

///|
impl FetchAdd with fetch_add(ptr : @c.Pointer[Atomic[Self]], value : Self) -> Self {
  FetchAdd::fetch_add_explicit(ptr, value, MemoryOrder::SeqCst)
}

///|
extern "c" fn atomic_fetch_add_explicit_int(
  object : @c.Pointer[Atomic[Int]],
  value : Int,
  order : MemoryOrder,
) -> Int = "moonbit_tonyfettes_c_atomic_fetch_add_explicit_int"

///|
pub impl FetchAdd for Int with fetch_add_explicit(
  ptr : @c.Pointer[Atomic[Int]],
  value : Int,
  order : MemoryOrder,
) -> Int {
  atomic_fetch_add_explicit_int(ptr, value, order)
}

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
