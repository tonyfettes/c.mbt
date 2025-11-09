///|
test "sinh" {
  @json.inspect(@math.sinh(0.0), content=0)
  @json.inspect(@math.sinh(1.0), content=1.1752011936438014)
  @json.inspect(@math.sinhf(0.0), content=0)
  @json.inspect(@math.sinhf(1.0), content=1.175201177597046)
}
