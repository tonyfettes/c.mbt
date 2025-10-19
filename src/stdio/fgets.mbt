///|
extern "c" fn c_fgets(
  data : @c.Pointer[Byte],
  size : Int,
  stream : FILE,
) -> @c.Pointer[Byte] = "fgets"

///|
pub fn[Data : @c.BytesLike] fgets(
  data : Data,
  size : Int,
  stream : FILE,
) -> Data? {
  let result = @c.borrow_bytes(data, data => c_fgets(data, size, stream))
  if result.is_null() {
    None
  } else {
    Some(data)
  }
}
