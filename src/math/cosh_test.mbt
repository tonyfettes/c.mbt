///|
test "cosh" {
  @json.inspect(@math.cosh(0.0), content=1)
  @json.inspect(@math.cosh(1.0), content=1.5430806348152437)
  @json.inspect(@math.coshf(0.0), content=1)
  @json.inspect(@math.coshf(1.0), content=1.5430806875228882)
}
