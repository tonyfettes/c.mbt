///|
#borrow(data)
extern "c" fn c_fputs(data : @c.Pointer[Byte], stream : FILE) -> Int = "fputs"

///|
pub fn[Data : @c.BytesLike] fputs(data : Data, stream : FILE) -> Int {
  @c.borrow_bytes(data, data => c_fputs(data, stream))
}
