///|
pub extern "c" fn get() -> Int = "moonbit_c_errno_get"

///|
pub extern "c" fn set(value : Int) -> Int = "moonbit_c_errno_set"

///|
pub(all) suberror Errno Int
