///|
extern "c" fn c_memcpy(
  dst : Pointer[Byte],
  src : Pointer[Byte],
  len : UInt64,
) -> Unit = "moonbit_c_memcpy"

///|
#alias(memcpy_to_bytes)
#alias(memcpy_from_bytes)
pub fn[Dst : BytesLike, Src : BytesLike] memcpy(
  dst : Dst,
  src : Src,
  len : UInt64,
) -> Unit {
  borrow_bytes_2(dst, src, (dst, src) => c_memcpy(dst, src, len))
}
