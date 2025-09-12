///|
pub extern "c" fn memcpy(
  dest : @c.Pointer[Byte],
  src : @c.Pointer[Byte],
  len : UInt64,
) -> Unit = "moonbit_c_memcpy"
