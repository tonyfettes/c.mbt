///|
struct JmpBuf[T] {
  env : Bytes
  mut val : T?
}

///|
extern "c" fn c_sizeof_jmp_buf() -> UInt64 = "moonbit_tonyfettes_c_sizeof_jmp_buf"

///|
let sizeof_jmp_buf : Int = c_sizeof_jmp_buf().to_int()

///|
pub fn[T] JmpBuf::new() -> JmpBuf[T] {
  JmpBuf::{ env: Bytes::make(sizeof_jmp_buf, 0), val: None }
}

///|
#borrow(env)
extern "c" fn c_longjmp(env : Bytes, val : Int) = "moonbit_tonyfettes_c_longjmp"

///|
pub fn[T, X] longjmp(env : JmpBuf[T], val : T) -> X {
  env.val = Some(val)
  c_longjmp(env.env, 1)
  abort("longjmp should never return")
}

///|
#borrow(env)
extern "c" fn c_setjmp(
  env : Bytes,
  func : FuncRef[((Int) -> Unit, Int) -> Unit],
  data : (Int) -> Unit,
) = "moonbit_tonyfettes_c_setjmp"

///|
pub fn[T, U] setjmp(env : JmpBuf[T], cb : (T?) -> U) -> U {
  let mut r = None
  c_setjmp(env.env, (f, status) => f(status), (status) => {
    if status == 0 {
      r = Some(cb(None))
    } else {
      r = Some(cb(env.val))
    }
  })
  r.unwrap()
}
