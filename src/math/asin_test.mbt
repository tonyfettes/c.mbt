///|
test "asin" {
  @json.inspect(@math.asin(0.0), content=0)
  @json.inspect(@math.asin(1.0), content=1.5707963267948966) // pi/2
  @json.inspect(@math.asinf(0.0), content=0)
  @json.inspect(@math.asinf(1.0), content=1.5707963705062866) // pi/2
}
