///|
test "tanh" {
  @json.inspect(@math.tanh(0.0), content=0)
  @json.inspect(@math.tanh(1.0), content=0.7615941559557649)
  @json.inspect(@math.tanhf(0.0), content=0)
  @json.inspect(@math.tanhf(1.0), content=0.7615941762924194)
}
