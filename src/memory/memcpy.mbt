///|
extern "c" fn c_memcpy(
  dst : @c.Pointer[Byte],
  src : @c.Pointer[Byte],
  len : UInt64,
) -> Unit = "moonbit_tonyfettes_c_memory_memcpy"

///|
#alias(memcpy_to_bytes)
#alias(memcpy_from_bytes)
pub fn[Dst : @c.BytesLike, Src : @c.BytesLike] memcpy(
  dst : Dst,
  src : Src,
  len : UInt64,
) -> Unit {
  @c.borrow_bytes_2(dst, src, (dst, src) => c_memcpy(dst, src, len))
}
