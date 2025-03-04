///|
fn main {
  let msg = b"How many characters does this string contain?\x00".to_fixedarray()
  let msg_mem = @memory.Memory::of_array(msg)
  let msg_ptr = @c.Pointer::of_memory(msg_mem)
  println("without null character: \{@c.strlen(msg_ptr)}")
  println("with null character: \{msg.length()}")
  @memory.free(msg_mem)
}
