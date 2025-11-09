///|
test "nanf" {
  @json.inspect(@math.is_nan(@math.nanf("1")), content=true)
  @json.inspect(@math.is_nan(@math.nan("0xF")), content=true)
}
