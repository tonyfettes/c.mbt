///|
test "floor" {
  @json.inspect(@math.floor(2.3), content=2)
  @json.inspect(@math.floor(2.0), content=2)
  @json.inspect(@math.floor(-2.3), content=-3)
  @json.inspect(@math.floorf(2.3), content=2)
  @json.inspect(@math.floorf(-2.3), content=-3)
}
