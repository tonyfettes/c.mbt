///|
fn init {
  ignore(@c.moonbit_ffi_make_closure)
}

///|
extern type File

///|
extern "c" fn fopen(path : Bytes, mode : Bytes) -> @c.Nullable[File] = "fopen"

///|
extern "c" fn exit(code : Int) = "exit"

///|
fn main {
  let file = fopen(b"main.mbt\x00", b"r\x00")
  match file.to() {
    None => exit(0)
    Some(_) => exit(1)
  }
}
