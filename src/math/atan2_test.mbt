///|
test "atan2" {
  @json.inspect(@math.atan2(0.0, 1.0), content=0)
  @json.inspect(@math.atan2(1.0, 1.0), content=0.7853981633974483) // pi/4
  @json.inspect(@math.atan2(1.0, 0.0), content=1.5707963267948966) // pi/2
  @json.inspect(@math.atan2f(0.0, 1.0), content=0)
  @json.inspect(@math.atan2f(1.0, 1.0), content=0.7853981852531433) // pi/4
}
