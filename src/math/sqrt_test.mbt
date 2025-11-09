///|
test "sqrt" {
  @json.inspect(@math.sqrt(0.0), content=0)
  @json.inspect(@math.sqrt(1.0), content=1)
  @json.inspect(@math.sqrt(4.0), content=2)
  @json.inspect(@math.sqrt(9.0), content=3)
  @json.inspect(@math.sqrtf(0.0), content=0)
  @json.inspect(@math.sqrtf(4.0), content=2)
}
