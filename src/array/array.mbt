///|
pub(all) struct Static[T, _](@pointer.Pointer[T])

///|
trait Length {
  to_size() -> @stddef.Size
}

///|
pub impl Length for @nat.Zero with to_size() -> @stddef.Size {
  0
}

///|
pub impl[N : Length] Length for @nat.Succ[N] with to_size() -> @stddef.Size {
  N::to_size() + 1
}

///|
pub impl[T : @sizeof.Sized, N : Length] @sizeof.Sized for Static[T, N] with size() -> @stddef.Size {
  T::size() * N::to_size()
}

///|
pub impl[T : @alignof.Aligned, N] @alignof.Aligned for Static[T, N] with alignment() -> @stddef.Size {
  T::alignment()
}

///|
pub impl[T, N] @pointer.Load for Static[T, N] with load(
  self : @pointer.Pointer[Static[T, N]],
) -> Static[T, N] {
  Static(self.cast())
}

///|
pub fn[T : @pointer.Load + @sizeof.Sized, N] Static::op_get(
  self : Static[T, N],
  index : Int,
) -> T {
  self.0[index]
}

///|
pub fn[T : @pointer.Store + @sizeof.Sized, N] Static::op_set(
  self : Static[T, N],
  index : Int,
  value : T,
) -> Unit {
  self.0[index] = value
}
