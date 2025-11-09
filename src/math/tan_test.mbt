///|
test "tan" {
  @json.inspect(@math.tan(0.0), content=0)
  @json.inspect(@math.tan(0.7853981633974483), content=0.9999999999999999) // pi/4, approximately 1
  @json.inspect(@math.tanf(0.0), content=0)
}
