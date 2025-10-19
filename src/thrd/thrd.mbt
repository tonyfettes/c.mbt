///|
type Thrd

///|
extern "c" fn sizeof_thrd() -> UInt64 = "moonbit_tonyfettes_c_sizeof_thrd_t"

///|
pub impl @c.Sizeof for Thrd with sizeof() -> UInt64 {
  sizeof_thrd()
}

///|
extern "c" fn thrd_success() -> Int = "moonbit_tonyfettes_c_thrd_success"

///|
pub let success : Int = thrd_success()

///|
extern "c" fn thrd_nomem() -> Int = "moonbit_tonyfettes_c_thrd_nomem"

///|
pub let nomem : Int = thrd_nomem()

///|
extern "c" fn thrd_timedout() -> Int = "moonbit_tonyfettes_c_thrd_timedout"

///|
pub let timedout : Int = thrd_timedout()

///|
extern "c" fn thrd_busy() -> Int = "moonbit_tonyfettes_c_thrd_busy"

///|
pub let busy : Int = thrd_busy()

///|
extern "c" fn thrd_error() -> Int = "moonbit_tonyfettes_c_thrd_error"

///|
pub let error : Int = thrd_error()
