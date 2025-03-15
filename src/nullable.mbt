///|
pub extern type Nullable[_]

///|
pub fn Nullable::some[T](value : T) -> Nullable[T] = "%identity"

///|
fn Nullable::unwrap[T](self : Nullable[T]) -> T = "%identity"

///|
extern "c" fn Nullable::_none() -> Nullable[Unit] = "moonbit_c_null"

///|
fn Nullable::cast[T, U](self : Nullable[T]) -> Nullable[U] = "%identity"

///|
pub fn Nullable::none[T]() -> Nullable[T] {
  Nullable::_none().cast()
}

///|
pub fn none[T]() -> Nullable[T] {
  Nullable::_none().cast()
}

///|
extern "c" fn Nullable::_is_null(self : Nullable[Unit]) -> Bool = "moonbit_c_is_null"

///|
pub fn Nullable::is_null[T](self : Nullable[T]) -> Bool {
  self.cast()._is_null()
}

///|
pub fn Nullable::of[T](option : T?) -> Nullable[T] {
  match option {
    Some(value) => Nullable::some(value)
    None => Nullable::none()
  }
}

///|
pub fn Nullable::to[T](self : Nullable[T]) -> T? {
  if self.is_null() {
    return None
  } else {
    return Some(self.unwrap())
  }
}
