///|
test "round" {
  @json.inspect(@math.round(2.3), content=2)
  @json.inspect(@math.round(2.5), content=3)
  @json.inspect(@math.round(2.7), content=3)
  @json.inspect(@math.round(-2.3), content=-2)
  @json.inspect(@math.round(-2.5), content=-3)
  @json.inspect(@math.roundf(2.5), content=3)
}
