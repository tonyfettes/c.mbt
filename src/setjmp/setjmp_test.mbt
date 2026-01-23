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
test "setjmp" {
  let env = @setjmp.JmpBuf::new()
  fn foo(status : Int) -> Unit {
    println("foo(\{status}) called")
    @setjmp.longjmp(env, status)
  }

  let mut count = 0
  @setjmp.setjmp(env, status => if status != Some(5) {
    count += 1
    foo(count)
  })
}

///|
let abort_env : @setjmp.JmpBuf[Error] = @setjmp.JmpBuf::new()

///|
test "intercept abort" {
  let sigabrt_handler = @signal.signal(
    @signal.sigabrt,
    @signal.handler(_ => @setjmp.longjmp(
      abort_env,
      @builtin.Failure("intercepted abort"),
    )),
  )
  defer ignore(@signal.signal(@signal.sigabrt, sigabrt_handler))
  json_inspect(
    @setjmp.setjmp(abort_env, status => match status {
      None => {
        abort("This abort should be intercepted")
        Ok(())
      }
      Some(error) => Err(error)
    }),
    content={ "Err": ["Failure", "intercepted abort"] },
  )
}
