///|
pub using @exit {exit, atexit}

///|
pub let exit_success : Int = @exit.success

///|
pub let exit_failure : Int = @exit.failure

///|
pub using @memory {malloc, free, realloc, calloc, memcpy, memset}

///|
pub type Ptr[T] = Pointer[T]

///|
pub using @pointer {
  type Pointer,
  null,
  borrow,
  borrow_bytes,
  borrow_array,
  borrow_ref,
}

///|
pub using @stdlib {getenv, system}

///|
pub using @string {strlen}
