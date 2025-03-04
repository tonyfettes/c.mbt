///|
extern "c" fn _malloc(size : UInt64) -> Pointer[Unit] = "moonbit_c_malloc"

///|
pub fn malloc[T : Sized]() -> Pointer[T] {
  identity(_malloc(T::size()))
}

///|
extern "c" fn _calloc(num : UInt64, size : UInt64) -> Pointer[Unit] = "moonbit_c_calloc"

///|
pub fn calloc[T : Sized, I : ToUInt64](num : I) -> Pointer[T] {
  identity(_calloc(num.to_uint64(), T::size()))
}

///|
extern "c" fn _realloc(ptr : Pointer[Unit], size : UInt64) -> Pointer[Unit] = "moonbit_c_realloc"

///|
pub fn realloc[T : Sized](ptr : Pointer[T], size : UInt64) -> Pointer[T] {
  identity(_realloc(identity(ptr), T::size() * size))
}

///|
extern "c" fn _free(ptr : Pointer[Unit]) -> Unit = "moonbit_c_free"

///|
pub fn free[T](self : Pointer[T]) -> Unit {
  _free(identity(self))
}

///|
extern "c" fn get_exit_success() -> Int = "moonbit_c_get_exit_success"

///|
pub let exit_success : Int = get_exit_success()

///|
extern "c" fn get_exit_failure() -> Int = "moonbit_c_get_exit_failure"

///|
pub let exit_failure : Int = get_exit_failure()

///|
pub extern "c" fn exit(exit_code : Int) -> Unit = "moonbit_c_exit"
