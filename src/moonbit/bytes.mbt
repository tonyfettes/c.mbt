///|
pub extern "c" fn bytes_data(bytes : Bytes) -> @c.Ptr[Byte] = "moonbit_c_bytes_data"

///|
pub fn bytes_of_ntbs(ntbs : @c.Ptr[Byte]) -> Bytes {
  let length = @c.strlen(ntbs)
  let bytes = Bytes::make(length.to_int(), b'\x00')
  let bytes_data = bytes_data(bytes)
  let _ = @c.memcpy(bytes_data.cast(), ntbs.cast(), length)
  bytes
}
