///|
#external
pub type FILE

pub extern "c" fn FILE::null() -> FILE = "moonbit_tonyfettes_c_pointer_null"

///|
extern "c" fn FILE::is_null(self : FILE) -> Bool = "moonbit_tonyfettes_c_pointer_is_null"

///|
trait IsNullableFILE {
  to_file(self : Self) -> FILE
}

///|
pub impl IsNullableFILE for FILE with to_file(self : FILE) -> FILE {
  return self
}

///|
pub impl IsNullableFILE for @c.Null with to_file(self : @c.Null) -> FILE = "%identity"
