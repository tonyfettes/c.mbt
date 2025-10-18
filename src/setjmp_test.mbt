///|
test "setjmp" {
  let env = @c.JmpBuf::new()
  fn foo(status : Int) -> Unit {
    println("foo(\{status}) called")
    @c.longjmp(env, status)
  }

  let mut count = 0
  @c.setjmp(
    env,
    setjmp=() => {
      count += 1
      foo(count)
    },
    longjmp=status => if status != 5 {
      count += 1
      foo(count)
    },
  )
  |> println()
  ignore(env)
}
