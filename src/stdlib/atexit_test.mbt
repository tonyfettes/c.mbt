pub let value : Ref[Int] = Ref::new(-1)

///|
test {
  assert_eq(@stdlib.atexit(() => println("atexit called: \{value.val}")), 0)
  value.val = 42
}
