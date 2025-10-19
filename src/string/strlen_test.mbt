///|
test "strlen[Bytes]" {
  let s : Bytes = b"Hello, World!\x00"
  let len : UInt64 = @string.strlen(s)
  @json.inspect(len, content="13")
}

///|
test "strlen[Pointer[Byte]]" {
  let s : Bytes = b"Hello, World!\x00"
  let ptr : @c.Pointer[Byte] = @memory.malloc(
    @c.sizeof(Byte::default()) * s.length().to_uint64(),
  )
  defer @memory.free(ptr)
  for i in 0UL..<s.length().to_uint64() {
    ptr[i] = s[i.to_int()]
  }
  let len : UInt64 = @string.strlen(ptr)
  @json.inspect(len, content="13")
}
