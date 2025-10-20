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
      Failure("intercepted abort"),
    )),
  )
  defer ignore(@signal.signal(@signal.sigabrt, sigabrt_handler))
  @json.inspect(
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
