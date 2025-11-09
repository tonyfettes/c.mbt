///|
test "fabs" {
  @json.inspect(@math.fabs(-1.0), content=1)
  @json.inspect(@math.fabs(-0.0), content=0)
  @json.inspect(@math.fabsf(-1.0), content=1)
  @json.inspect(@math.fabsf(-0.0), content=0)
}
