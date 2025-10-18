///|
extern "c" fn _exit(status : Int) = "exit"

///|
pub fn[T] exit(status : Int) -> T {
  _exit(status)
  abort("exit should never return")
}

///|
extern "c" fn c_exit_success() -> Int = "moonbit_tonyfettes_c_exit_success"

///|
extern "c" fn c_exit_failure() -> Int = "moonbit_tonyfettes_c_exit_failure"

///|
pub let exit_success : Int = c_exit_success()

///|
pub let exit_failure : Int = c_exit_failure()
