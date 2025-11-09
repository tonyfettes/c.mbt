///|
test "ceil" {
  @json.inspect(@math.ceil(2.3), content=3)
  @json.inspect(@math.ceil(2.0), content=2)
  @json.inspect(@math.ceil(-2.3), content=-2)
  @json.inspect(@math.ceilf(2.3), content=3)
  @json.inspect(@math.ceilf(-2.3), content=-2)
}
