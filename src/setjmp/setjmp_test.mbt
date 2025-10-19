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
let env : Array[@setjmp.JmpBuf[Error]] = []

///|
fn[X] raises(e : Error) -> X {
  guard env.last() is Some(env) else {
    abort("raises called outside of catches")
  }
  @setjmp.longjmp(env, e)
}

///|
fn[T] catches(f : () -> T) -> T raise {
  let jmp_buf = @setjmp.JmpBuf::new()
  env.push(jmp_buf)
  let result = @setjmp.setjmp(jmp_buf, status => match status {
    None => Ok(f())
    Some(e) => Err(e)
  })
  guard env.pop() is Some(pop) && physical_equal(pop, jmp_buf) else {
    abort("raises-catches stack corrupted")
  }
  result.unwrap_or_error()
}

///|
test "unchecked-exception/raises-catches" {
  @json.inspect(
    try? catches(() => if true { raises(Failure("test")) } else { 42 }),
    content={ "Err": ["Failure", "test"] },
  )
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

///|
test "unchecked-exception/raises-outside-of-catches" {
  let sigabrt_handler = @signal.signal(
    @signal.sigabrt,
    @signal.handler(_ => @setjmp.longjmp(abort_env, Failure("aborted"))),
  )
  defer ignore(@signal.signal(@signal.sigabrt, sigabrt_handler))
  @json.inspect(
    @setjmp.setjmp(abort_env, status => match status {
      None => {
        raises(Failure("raises called outside of catches"))
        Ok(())
      }
      Some(error) => Err(error)
    }),
    content={ "Err": ["Failure", "aborted"] },
  )
}

///|
test "unchecked-exception/nested-raises-catches" {
  @json.inspect(
    try? catches(() => catches(() => if true {
      raises(Failure("nested"))
    } else {
      42
    }) catch {
      error => raises(error)
    }),
    content={ "Err": ["Failure", "nested"] },
  )
}
