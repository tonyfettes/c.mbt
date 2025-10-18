///|
test "setjmp" {
  let env = @c.JmpBuf::new()
  fn foo(status : Int) -> Unit {
    println("foo(\{status}) called")
    @c.longjmp(env, status)
  }

  let mut count = 0
  @c.setjmp(env, status => if status != Some(5) {
    count += 1
    foo(count)
  })
}

///|
let env : Ref[@c.JmpBuf[Error]?] = Ref::new(None)

///|
fn[X] raises(e : Error) -> X {
  guard env.val is Some(env) else { abort("raises called outside of catches") }
  @c.longjmp(env, e)
}

///|
fn[T] catches(f : () -> T) -> T raise {
  let env = match env.val {
    Some(env) => env
    None => {
      let jmp_buf = @c.JmpBuf::new()
      env.val = Some(jmp_buf)
      jmp_buf
    }
  }
  @c.setjmp(env, status => match status {
    None => Ok(f())
    Some(e) => Err(e)
  }).unwrap_or_error()
}

///|
test "unchecked-exception/raises-catches" {
  @json.inspect(
    try? catches(() => if true { raises(Failure("test")) } else { 42 }),
    content={ "Err": ["Failure", "test"] },
  )
}

test "unchecked-exception/raises-outside-of-catches" {
  raises(Failure("raises called outside of catches"))
}
