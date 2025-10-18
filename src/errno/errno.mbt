///|
pub extern "c" fn get() -> Int = "moonbit_c_errno_get"

///|
pub extern "c" fn set(value : Int) = "moonbit_c_errno_set"

///|
pub(all) suberror Errno Int

///|
extern "c" fn c_strerror(value : Int) -> @c.Pointer[Byte] = "strerror"

///|
pub impl Show for Errno with output(self : Errno, logger : &Logger) -> Unit {
  let Errno(value) = self
  let str = c_strerror(value)
  let mut len = 0
  while str[len.to_uint64()] != 0 {
    len += 1
  }
  let buf : FixedArray[Byte] = FixedArray::make(len, 0)
  for i in 0..<len {
    buf[i] = str[i.to_uint64()]
  }
  logger.write_string(
    @encoding/utf8.decode_lossy(buf.unsafe_reinterpret_as_bytes()),
  )
}

///|
pub impl ToJson for Errno with to_json(self : Errno) -> Json {
  let Errno(value) = self
  ["Errno", [value, self.to_string()]]
}
