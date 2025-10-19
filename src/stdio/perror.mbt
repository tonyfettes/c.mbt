///|
extern "c" fn c_perror(s : @c.Pointer[Byte]) = "perror"

///|
pub fn[S : @c.BytesLike] perror(s : S) -> Unit {
  @c.borrow_bytes(s, s => c_perror(s))
}
