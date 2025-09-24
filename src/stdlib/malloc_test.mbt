///|
test "memcpy" {
  let bytes : Bytes = Bytes::makei(8, i => i.to_byte())
  let ptr : @c.Pointer[Byte] = @stdlib.malloc(8)
  defer @stdlib.free(ptr)
  @stdlib.memcpy_from_bytes(ptr, bytes, 8)
  @json.inspect(ptr[0], content=0)
  @json.inspect(ptr[1], content=1)
  @json.inspect(ptr[2], content=2)
  @json.inspect(ptr[3], content=3)
  @json.inspect(ptr[4], content=4)
  @json.inspect(ptr[5], content=5)
  @json.inspect(ptr[6], content=6)
  @json.inspect(ptr[7], content=7)
}
