///|
test "log10" {
  @json.inspect(@math.log10(1.0), content=0)
  @json.inspect(@math.log10(10.0), content=1)
  @json.inspect(@math.log10(100.0), content=2)
  @json.inspect(@math.log10f(1.0), content=0)
  @json.inspect(@math.log10f(10.0), content=1)
}
