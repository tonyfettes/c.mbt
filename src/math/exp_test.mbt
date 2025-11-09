///|
test "exp" {
  @json.inspect(@math.exp(0.0), content=1)
  @json.inspect(@math.exp(1.0), content=2.718281828459045)
  @json.inspect(@math.expf(0.0), content=1)
  @json.inspect(@math.expf(1.0), content=2.7182817459106445)
}
