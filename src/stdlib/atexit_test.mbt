///|
pub let value : Ref[Int] = Ref::new(-1)

///|
test "atexit" {
  assert_eq(
    @stdlib.atexit(() => if value.val != 42 { abort("Expected value to be 42") }),
    0,
  )
  value.val = 42
}
