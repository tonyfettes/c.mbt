///|
extern "c" fn memory_memset(
  dst : @c.Pointer[Byte],
  val : Byte,
  len : UInt64,
) -> Unit = "moonbit_tonyfettes_c_memory_memset"

///|
pub fn[Dst : @c.BytesLike] memset(dst : Dst, val : Byte, len : UInt64) -> Unit {
  @c.borrow_bytes(dst, dst => memory_memset(dst, val, len))
}
