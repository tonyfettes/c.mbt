///|
pub extern "c" fn strlen(str : Pointer[Byte]) -> UInt64 = "moonbit_c_strlen"

///|
pub extern "c" fn strerror(errnum : Int) -> Pointer[Byte] = "moonbit_c_strerror"
