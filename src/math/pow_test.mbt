///|
test "pow" {
  @json.inspect(@math.pow(2.0, 2.0), content=4)
  @json.inspect(@math.powf(2.0, 2.0), content=4)
}
