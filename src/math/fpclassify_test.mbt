///|
test "fpclassify[Double]" {
  let fpclassify : (Double) -> @math.FpCategory = @math.fpclassify
  @json.inspect(fpclassify(1.0 / 0.0), content="Infinite")
  @json.inspect(fpclassify(0.0 / 0.0), content="Nan")
  @json.inspect(fpclassify(@double.min_positive / 2), content="Subnormal")
  @json.inspect(fpclassify(-0.0), content="Zero")
  @json.inspect(fpclassify(1.0), content="Normal")
}

///|
test "fpclassify[Float]" {
  let fpclassify : (Float) -> @math.FpCategory = @math.fpclassify
  @json.inspect(fpclassify(1.0 / 0.0), content="Infinite")
  @json.inspect(fpclassify(0.0 / 0.0), content="Nan")
  @json.inspect(fpclassify(@float.min_positive / 2), content="Subnormal")
  @json.inspect(fpclassify(-0.0), content="Zero")
  @json.inspect(fpclassify(1.0), content="Normal")
}

///|
test "is_nan" {

}

///|
test "is_normal" {

}
