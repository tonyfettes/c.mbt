///|
extern "c" fn c_fgets(
  data : @c.Pointer[Byte],
  stream : FILE,
) -> @c.Pointer[Byte] = "fgets"

///|
pub fn[Data : @c.BytesLike] fgets(data : Data, stream : FILE) -> Data? {
  let result = @c.borrow_bytes(data, data => c_fgets(data, stream))
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
pub fn[Data : @c.BytesLike] fputs(data : Data, stream : FILE) -> Int {
  @c.borrow_bytes(data, data => c_fputs(data, stream))
}
