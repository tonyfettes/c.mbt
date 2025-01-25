///|
extern "c" fn strlen(str : Ptr[Byte]) -> UInt64 = "strlen"

///|
extern "c" fn strerror(errnum : Int) -> Ptr[Byte] = "strerror"

///|
pub extern "c" fn bytes_to_ntbs(bytes : Bytes) -> Ptr[Byte] = "moonbit_c_bytes_to_ntbs"
