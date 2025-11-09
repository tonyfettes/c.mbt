///|
test "sin" {
  @json.inspect(@math.sin(0.0), content=0)
  @json.inspect(@math.sin(1.5707963267948966), content=1) // pi/2
  @json.inspect(@math.sinf(0.0), content=0)
  @json.inspect(@math.sinf(1.5707963267948966), content=1) // pi/2
}
