///|
extern "c" fn get_exit_success() -> Int = "moonbit_c_get_exit_success"

///|
pub let exit_success : Int = get_exit_success()

///|
extern "c" fn get_exit_failure() -> Int = "moonbit_c_get_exit_failure"

///|
pub let exit_failure : Int = get_exit_failure()

///|
pub extern "c" fn exit(exit_code : Int) -> Unit = "moonbit_c_exit"
