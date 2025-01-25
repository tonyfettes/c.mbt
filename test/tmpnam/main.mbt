///|
fn main {
  try {
    // Note, the compiler/linker may issue a security warning, e.g. GCC:
    // "warning: the use of `tmpnam' is dangerous, better use `mkstemp'"
    let name1 = @c.tmpnam(@c.null())
    let name1 = @moonbit.bytes_of_ntbs(name1)
    let name1 = @encoding.decode_strict(UTF8, name1).to_string!()
    println("temporary file name: \{name1}")
    let name2 = Bytes::make(@c.l_tmpnam.to_int(), b'\x00')
    if not(@c.tmpnam(@moonbit.bytes_data(name2)).is_null()) {
      let name2 = @encoding.decode_strict(UTF8, name2).to_string!()
      println("temporary file name: \{name2}")
    }
  } catch {
    error => println("error: \{error}")
  }
}
