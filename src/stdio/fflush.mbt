///|
extern "c" fn c_fflush(stream : @c.Nullable[FILE]) -> Int = "fflush"

///|
trait ToNullableFILE {
  to_nullable_FILE(self : Self) -> @c.Nullable[FILE]
}

///|
pub impl ToNullableFILE for FILE with to_nullable_FILE(self : FILE) -> @c.Nullable[
  FILE,
] {
  @c.Nullable::some(self)
}

///|
pub impl ToNullableFILE for @c.Null with to_nullable_FILE(self : @c.Null) -> @c.Nullable[
  FILE,
] {
  ignore(self)
  @c.Nullable::none()
}

///|
pub fn[T : ToNullableFILE] fflush(stream : T) -> Int {
  c_fflush(T::to_nullable_FILE(stream))
}
