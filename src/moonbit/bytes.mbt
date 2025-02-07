///|
extern "c" fn bytes_data(bytes : Bytes) -> @c.Ptr[Byte] = "moonbit_c_bytes_data"

///|
extern "c" fn bytes_decref(bytes : Bytes) -> Unit = "moonbit_c_bytes_decref"

///|
pub fn bytes_to_ntbs(bytes : Bytes, append_null~ : Bool = true) -> @c.Ptr[Byte] {
  let length = bytes.length().to_uint64()
  let ntbs = @c.calloc(length + (if append_null { 1 } else { 0 }))
  let bytes_data = bytes_data(bytes)
  let _ = @c.memcpy(ntbs.cast(), bytes_data.cast(), length)
  bytes_decref(bytes)
  ntbs
}

///|
pub fn bytes_of_ntbs(ntbs : @c.Ptr[Byte]) -> Bytes {
  let length = @c.strlen(ntbs)
  let bytes = Bytes::make(length.to_int(), b'\x00')
  let bytes_data = bytes_data(bytes)
  let _ = @c.memcpy(bytes_data.cast(), ntbs.cast(), length)
  bytes_decref(bytes)
  bytes
}
