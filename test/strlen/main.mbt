///|
fn main {
  let bytes = b"How many characters does this string contain?\x00"
  let str = @moonbit.bytes_data(bytes)
  println("without null character: \{@c.strlen(str)}")
  println("with null character: \{bytes.length()}")
}
