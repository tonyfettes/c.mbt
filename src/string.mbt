///|
pub extern "c" fn strlen(str : Ptr[Byte]) -> UInt64 = "moonbit_c_strlen"

///|
pub extern "c" fn strerror(errnum : Int) -> Ptr[Byte] = "moonbit_c_strerror"
