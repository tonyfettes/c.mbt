///|
test "memset" {
  let val : Byte = 0x7f
  let len : UInt64 = 16
  let ptr : @c.Ptr[Byte] = @memory.malloc(@c.sizeof(val) * len)
  defer @memory.free(ptr)
  @memory.memset(ptr, val, len)
  for i in 0UL..<len {
    @json.inspect(ptr[i], content=val.to_json())
  }
}
