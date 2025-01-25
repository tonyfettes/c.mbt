///|
pub extern "c" fn setlocale(category : Int, locale : Ptr[Byte]) -> Ptr[Byte] = "moonbit_c_setlocale"

///|
extern "c" fn get_lc_all() -> Int = "moonbit_c_get_lc_all"

///|
pub let lc_all : Int = get_lc_all()
