///|
extern "c" fn c_fgets(
  data : @c.Pointer[Byte],
  stream : FILE,
) -> @c.Pointer[Byte] = "fgets"

///|
pub fn[Data : @c.AsBytePtr] fgets(data : Data, stream : FILE) -> Data? {
  let result = c_fgets(data.as_byte_ptr(), stream)
  if result.is_null() {
    None
  } else {
    Some(data)
  }
}

///|
#borrow(data)
extern "c" fn c_fputs(data : @c.Pointer[Byte], stream : FILE) -> Int = "fputs"

///|
pub fn[Data : @c.AsBytePtr] fputs(data : Data, stream : FILE) -> Int {
  c_fputs(data.as_byte_ptr(), stream)
}
