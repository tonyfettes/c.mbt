///|
pub extern "c" fn get() -> Int = "moonbit_tonyfettes_c_errno_get"

///|
pub extern "c" fn set(value : Int) = "moonbit_tonyfettes_c_errno_set"

///|
pub(all) suberror Errno Int

///|
pub extern "c" fn strerror(value : Int) -> @c.Pointer[Byte] = "moonbit_tonyfettes_c_errno_strerror"

///|
pub extern "c" fn errno_edom() -> Int = "moonbit_tonyfettes_c_errno_edom"

///|
pub let edom : Int = errno_edom()

///|
pub extern "c" fn errno_erange() -> Int = "moonbit_tonyfettes_c_errno_erange"

///|
pub let erange : Int = errno_erange()

///|
pub impl Show for Errno with output(self : Errno, logger : &Logger) -> Unit {
  let Errno(value) = self
  let str = strerror(value)
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
