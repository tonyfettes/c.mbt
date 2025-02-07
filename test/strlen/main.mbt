///|
fn main {
  let bytes = b"How many characters does this string contain?\x00"
  let str = @moonbit.bytes_to_ntbs(bytes, append_null=false)
  println("without null character: \{@c.strlen(str)}")
  println("with null character: \{bytes.length()}")
  @c.free(str)
}
