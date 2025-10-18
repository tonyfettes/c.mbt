///|
extern "c" fn c_perror(s : @c.Pointer[Byte]) = "perror"

///|
pub fn[S : @c.AsBytePtr] perror(s : S) -> Unit {
  c_perror(s.as_byte_ptr())
}
