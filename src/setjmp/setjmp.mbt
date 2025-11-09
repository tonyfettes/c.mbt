// Copyright 2025 International Digital Economy Academy
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

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
#owned(env)
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
pub fn[T, R] setjmp(env : JmpBuf[T], cb : (T?) -> R) -> R {
  let r : FixedArray[R?] = [None]
  c_setjmp(env.env, (f, status) => f(status), status => if status == 0 {
    r[0] = Some(cb(None))
  } else {
    @c.decref(env.env)
    @c.decref(r)
    r[0] = Some(cb(env.val))
  })
  r[0].unwrap()
}
