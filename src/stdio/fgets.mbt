///|
#borrow(data)
extern "c" fn c_fgets(
  data : Bytes,
  length : Int,
  stream : FILE,
) -> @c.Pointer[Byte] = "fgets"

///|
pub fn fgets(data : Bytes, stream : FILE) -> Bool {
  !c_fgets(data, data.length(), stream).is_null()
}

///|
#borrow(data)
pub extern "c" fn fputs(data : Bytes, stream : FILE) -> Int = "fputs"
