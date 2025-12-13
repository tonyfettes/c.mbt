///|
test "Reader" {
  let memory : @pointer.Pointer[Unit] = @memory.malloc(16)
  let writer = @struct.Writer::new(memory.cast())
  defer @memory.free(memory)
  writer.write(b'H')
  writer.write(1234)
  let reader = @struct.Reader::new(memory.cast())
  let byte : Byte = reader.read()
  let int : Int = reader.read()
  @json.inspect(byte, content=72)
  @json.inspect(int, content=1234)
}
