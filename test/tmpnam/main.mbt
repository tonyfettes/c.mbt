///|
fn main {
  // Note, the compiler/linker may issue a security warning, e.g. GCC:
  // "warning: the use of `tmpnam' is dangerous, better use `mkstemp'"
  let name1_ptr = @c.tmpnam(@c.null())
  let name1_bytes = @moonbit.bytes_of_ntbs(name1_ptr)
  let name1 = @encoding.decode_strict(UTF8, name1_bytes).to_string?().unwrap()
  println("temporary file name: \{name1}")
  @c.free(name1_ptr)
  let name2_ptr : @c.Ptr[Byte] = @c.calloc(@c.l_tmpnam + 1)
  if not(@c.tmpnam(name2_ptr).is_null()) {
    let name2_bytes = @moonbit.bytes_of_ntbs(name2_ptr)
    let name2 = @encoding.decode_strict(UTF8, name2_bytes).to_string?().unwrap()
    println("temporary file name: \{name2}")
  }
  @c.free(name2_ptr)
}
