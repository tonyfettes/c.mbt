///|
struct JmpBuf {
  env : Bytes
  mut val : Int
}

///|
extern "c" fn c_sizeof_jmp_buf() -> UInt64 = "moonbit_tonyfettes_c_sizeof_jmp_buf"

///|
let sizeof_jmp_buf : Int = c_sizeof_jmp_buf().to_int()

///|
pub fn JmpBuf::new() -> JmpBuf {
  JmpBuf::{ env: Bytes::make(sizeof_jmp_buf, 0), val: 0 }
}

///|
#borrow(env)
extern "c" fn c_longjmp(env : Bytes, val : Int) = "moonbit_tonyfettes_c_longjmp"

///|
pub fn[T] longjmp(env : JmpBuf, val : Int) -> T {
  let val = if val == 0 { 1 } else { val }
  env.val = val
  c_longjmp(env.env, val)
  abort("longjmp should never return")
}

///|
#borrow(env)
extern "c" fn c_setjmp(
  env : Bytes,
  setjmp_func : FuncRef[(() -> Unit) -> Unit],
  setjmp_data : () -> Unit,
  longjmp_func : FuncRef[(() -> Unit) -> Unit],
  longjmp_data : () -> Unit,
) -> Int = "moonbit_tonyfettes_c_setjmp"

///|
pub fn setjmp(
  env : JmpBuf,
  setjmp~ : () -> Unit,
  longjmp~ : (Int) -> Unit,
) -> Int {
  if c_setjmp(env.env, f => f(), setjmp, f => f(), () => longjmp(env.val)) == 0 {
    0
  } else {
    println("setjmp returning with value \{env.val})")
    env.val
  }
}
