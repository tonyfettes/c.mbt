///|
test "fmod" {
  @json.inspect(@math.fmod(5.3, 2.0), content=1.2999999999999998)
  @json.inspect(@math.fmod(18.5, 4.2), content=1.6999999999999993)
  @json.inspect(@math.fmod(-10.0, 3.0), content=-1)
  @json.inspect(@math.fmodf(5.3, 2.0), content=1.3000001907348633)
}
