///|
pub extern "c" fn strlen(str : Ptr[Byte]) -> UInt64 = "moonbit_c_strlen"

///|
extern "c" fn strerror(errnum : Int) -> Ptr[Byte] = "strerror"
