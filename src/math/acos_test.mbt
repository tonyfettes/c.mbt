///|
test "acos" {
  @json.inspect(@math.acos(1.0), content=0)
  @json.inspect(@math.acos(0.0), content=1.5707963267948966) // pi/2
  @json.inspect(@math.acosf(1.0), content=0)
  @json.inspect(@math.acosf(0.0), content=1.5707963705062866) // pi/2
}
