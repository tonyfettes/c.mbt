///|
fn main {
  let msg = b"How many characters does this string contain?\x00"
  let msg_ptr = msg |> @c.Pointer::of_bytes()
  println("without null character: \{@c.strlen(msg_ptr)}")
  println("with null character: \{msg.length()}")
}
