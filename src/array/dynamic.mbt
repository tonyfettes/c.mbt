///|
struct Dynamic[T](@pointer.Pointer[T])

///|
pub impl[T] @pointer.Load for Dynamic[T] with load(
  self : @pointer.Pointer[Dynamic[T]],
) -> Dynamic[T] {
  Dynamic(self.cast())
}

///|
pub fn[T : @pointer.Load + @sizeof.Sized] Dynamic::op_get(
  self : Dynamic[T],
  index : Int,
) -> T {
  self.0[index]
}

///|
pub fn[T : @pointer.Store + @sizeof.Sized] Dynamic::op_set(
  self : Dynamic[T],
  index : Int,
  value : T,
) -> Unit {
  self.0[index] = value
}

///|
pub fn[T] Dynamic::pointer(self : Dynamic[T]) -> @pointer.Pointer[T] {
  self.0
}
