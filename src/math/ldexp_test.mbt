///|
test "ldexp" {
  @json.inspect(@math.ldexp(0.5, 3), content=4) // 0.5 * 2^3 = 4
  @json.inspect(@math.ldexp(1.0, 0), content=1) // 1.0 * 2^0 = 1
  @json.inspect(@math.ldexp(2.0, 2), content=8) // 2.0 * 2^2 = 8
  @json.inspect(@math.ldexpf(0.5, 3), content=4)
}
