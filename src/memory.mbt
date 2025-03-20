///|
type Memory[T]

///|
fn Memory::as_pointer[T : Sized](self : Memory[T]) -> Pointer[Byte] = "%identity"

///|
pub(open) trait Sized {
  sizeof() -> Int
}

///|
fn moonbit_malloc(size : Int) -> Pointer[Unit] = "$moonbit.malloc"

///|
pub fn Memory::load[T : Sized](memory : Memory[T], offset : Int) -> T {
  let self : Pointer[Byte] = moonbit_malloc(T::sizeof()).cast()
  let pointer : Pointer[Byte] = memory.as_pointer().cast()
  let offset = offset * T::sizeof()
  for i in 0..<T::sizeof() {
    self[i] = pointer[offset + i]
  }
  self.cast().as_nullable().unwrap()
}

///|
pub fn Memory::store[T : Sized](
  memory : Memory[T],
  offset : Int,
  value : T
) -> Unit {
  let pointer : Pointer[Byte] = memory.as_pointer().cast()
  let value : Pointer[Byte] = Nullable::some(value).as_pointer().cast()
  for i in 0..<T::sizeof() {
    pointer[offset + i] = value[i]
  }
}
