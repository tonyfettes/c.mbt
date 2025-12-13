///|
test "sizeof" {
  assert_eq(@sizeof.sizeof((_ : Byte) => ()), 1)
  assert_eq(@sizeof.sizeof((_ : Int16) => ()), 2)
  assert_eq(@sizeof.sizeof((_ : UInt16) => ()), 2)
  assert_eq(@sizeof.sizeof((_ : Int) => ()), 4)
  assert_eq(@sizeof.sizeof((_ : UInt) => ()), 4)
  assert_eq(@sizeof.sizeof((_ : Int64) => ()), 8)
  assert_eq(@sizeof.sizeof((_ : UInt64) => ()), 8)
  assert_eq(@sizeof.sizeof((_ : Float) => ()), 4)
  assert_eq(@sizeof.sizeof((_ : Double) => ()), 8)
  assert_eq(
    @sizeof.sizeof((_ : @pointer.Pointer[Byte]) => ()),
    @pointer.Pointer::sizeof(),
  )
}
