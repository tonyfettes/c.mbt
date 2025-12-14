///|
test "Size::sizeof" {
  @stddef.Size::sizeof() |> ignore()
}

///|
test "Size::to_int" {
  let size = @stddef.Size(42UL)
  @json.inspect(size.to_int(), content=42)
}

///|
test "Size::to_uint64" {
  let size = @stddef.Size(42UL)
  @json.inspect(size.to_uint64(), content="42")
}

///|
test "Size::reinterpret_as_int64" {
  let size = @stddef.Size(42UL)
  @json.inspect(size.reinterpret_as_int64(), content="42")
}

///|
test "Size::to_json" {
  let original = @stddef.Size(@uint64.max_value)
  let json = original.to_json()
  inspect(json.stringify(indent=2), content="18446744073709551615")
  let parsed : @stddef.Size = @json.from_json(json)
  assert_eq(parsed, original)
}

///|
test "Size::from_json" {
  let size : @stddef.Size = @json.from_json(42)
  @json.inspect(size.to_uint64(), content="42")
}
