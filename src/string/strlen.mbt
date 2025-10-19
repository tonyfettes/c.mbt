///|
extern "c" fn string_strlen(s : @c.Pointer[Byte]) -> UInt64 = "moonbit_tonyfettes_c_string_strlen"

///|
pub fn[Str : @c.BytesLike] strlen(s : Str) -> UInt64 {
  @c.borrow_bytes(s, s => string_strlen(s))
}
