///|
pub fn[T] unsafe_take_from(value : T) -> Ptr[Unit] = "%identity"

///|
pub fn[T] take_from_ref(value : Ref[T]) -> Ptr[T] = "%identity"

///|
pub fn[T] take_from_array(value : FixedArray[T]) -> Ptr[T] = "%identity"

///|
pub fn take_from_bytes(value : Bytes) -> Ptr[Byte] = "%identity"

///|
pub(open) trait TakeFrom {
  take_from(Self) -> Ptr[Unit]
}

///|
pub fn[T] unsafe_move_into(ptr : Ptr[Unit]) -> T = "%identity"

///|
pub fn[T] move_into_ref(ptr : Ptr[T]) -> Ref[T] = "%identity"

///|
pub fn[T] move_into_array(ptr : Ptr[T]) -> FixedArray[T] = "%identity"

///|
pub fn move_into_bytes(ptr : Ptr[Byte]) -> Bytes = "%identity"

///|
pub(open) trait MoveInto {
  move_into(Ptr[Unit]) -> Self
}

///|
pub fn[T, R] borrow_ref(ref_ : Ref[T], f : (Ptr[T]) -> R) -> R {
  let ptr = take_from_ref(ref_)
  let val : R = f(ptr)
  let _ : Ref[T] = move_into_ref(ptr)
  val
}

///|
pub fn[T, R] borrow_array(array : FixedArray[T], f : (Ptr[T]) -> R) -> R {
  let ptr = take_from_array(array)
  let val : R = f(ptr)
  let _ : FixedArray[T] = move_into_array(ptr)
  val
}

///|
pub fn[R] borrow_bytes(bytes : Bytes, f : (Ptr[Byte]) -> R) -> R {
  let ptr = take_from_bytes(bytes)
  let val : R = f(ptr)
  let _ : Bytes = move_into_bytes(ptr)
  val
}

///|
pub fn[T, R] unsafe_borrow(value : T, f : (Ptr[Unit]) -> R) -> R {
  let ptr = unsafe_take_from(value)
  let val : R = f(ptr)
  let _ : T = unsafe_move_into(ptr)
  val
}

///|
pub(open) trait Borrow {
  take_from(Self) -> Ptr[Unit]
  move_into(Ptr[Unit]) -> Self
}

///|
#locals(f)
pub fn[T : Borrow, R] borrow(value : T, f : (Ptr[Unit]) -> R) -> R {
  let ptr = T::take_from(value)
  let val : R = for {
    break f(ptr)
  }
  let _ : T = T::move_into(ptr)
  val
}

///|
pub impl Borrow for Bytes with take_from(self : Bytes) -> Ptr[Unit] = "%identity"

///|
pub impl Borrow for Bytes with move_into(ptr : Ptr[Unit]) -> Bytes = "%identity"

///|
pub impl[T] Borrow for Ptr[T] with take_from(self : Ptr[T]) -> Ptr[Unit] = "%identity"

///|
pub impl[T] Borrow for Ptr[T] with move_into(ptr : Ptr[Unit]) -> Ptr[T] = "%identity"

///|
pub impl[T] Borrow for FixedArray[T] with take_from(self : FixedArray[T]) -> Ptr[
  Unit,
] = "%identity"

///|
pub impl[T] Borrow for FixedArray[T] with move_into(ptr : Ptr[Unit]) -> FixedArray[
  T,
] = "%identity"
