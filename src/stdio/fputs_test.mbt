///|
test "fputs" {
  let path = b"fputs_test.txt"
  let file = @stdio.fopen(path, b"w")
  let text = b"Hello, world!"
  let _ = @stdio.fputs(text, file)
  let read : FixedArray[Byte] = FixedArray::make(text.length(), 0)
  @stdio.fflush(file)
  @stdio.fclose(file)
  let file = @stdio.fopen(path, b"r")
  let n = @stdio.fread(read, @sizeof.Byte, text.length().to_uint64(), file)
  @json.inspect(
    @encoding/utf8.decode(read.unsafe_reinterpret_as_bytes()[0:n.to_int()]),
    content="Hello, world!",
  )
  @stdio.fclose(file)
  @stdio.remove(path)
}
