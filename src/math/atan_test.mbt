///|
test "atan" {
  @json.inspect(@math.atan(0.0), content=0)
  @json.inspect(@math.atan(1.0), content=0.7853981633974483) // pi/4
  @json.inspect(@math.atanf(0.0), content=0)
  @json.inspect(@math.atanf(1.0), content=0.7853981852531433) // pi/4
}
