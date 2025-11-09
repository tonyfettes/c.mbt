///|
test "log" {
  @json.inspect(@math.log(1.0), content=0)
  @json.inspect(@math.log(2.718281828459045), content=1)
  @json.inspect(@math.logf(1.0), content=0)
  @json.inspect(@math.logf(2.7182817459106445), content=0.9999999403953552)
}
