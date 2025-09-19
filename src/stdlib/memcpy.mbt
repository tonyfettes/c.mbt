///|
pub extern "c" fn memcpy(
  dest : @c.Pointer[Byte],
  src : @c.Pointer[Byte],
  len : UInt64,
) -> Unit = "moonbit_c_memcpy"

///|
fn bytes_to_c_ptr(bytes : Bytes) -> @c.Pointer[Byte] = "%identity"

///|
pub fn memcpy_from_bytes(
  dest : @c.Pointer[Byte],
  source : Bytes,
  length : UInt64,
) -> Unit {
  let src_ptr = bytes_to_c_ptr(source)
  memcpy(dest, src_ptr, length)
}

///|
pub fn memcpy_to_bytes(
  dest : Bytes,
  source : @c.Pointer[Byte],
  length : UInt64,
) -> Unit {
  let dest_ptr = bytes_to_c_ptr(dest)
  memcpy(dest_ptr, source, length)
}
