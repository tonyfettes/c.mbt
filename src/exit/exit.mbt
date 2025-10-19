///|
extern "c" fn _exit(status : Int) = "exit"

///|
#coverage.skip
pub fn[T] exit(status : Int) -> T {
  _exit(status)
  abort("exit should never return")
}

///|
extern "c" fn exit_success() -> Int = "moonbit_tonyfettes_c_exit_success"

///|
extern "c" fn exit_failure() -> Int = "moonbit_tonyfettes_c_exit_failure"

///|
pub let success : Int = exit_success()

///|
pub let failure : Int = exit_failure()
