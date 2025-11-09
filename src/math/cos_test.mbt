///|
test "cos" {
  @json.inspect(@math.cos(0.0), content=1)
  @json.inspect(@math.cos(1.5707963267948966), content=6.123233995736766e-17) // pi/2, approximately 0
  @json.inspect(@math.cosf(0.0), content=1)
}
