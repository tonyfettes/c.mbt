///|
test "srand" {
  @rand.srand(42)
  @json.inspect(@rand.rand() >= 0, content=true)
  @json.inspect(@rand.rand() <= @rand.max, content=true)
}
