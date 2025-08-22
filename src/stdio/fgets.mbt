///|
#borrow(data)
pub extern "c" fn fgets(data : Bytes, stream : FILE) -> Bool = "moonbit_c_fgets"

///|
#borrow(data)
pub extern "c" fn fputs(data : Bytes, stream : FILE) -> Int = "moonbit_c_fputs"
