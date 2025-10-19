///|
test "freopen" {
  let path = b"freopen_test.txt"
  let _ = @stdio.freopen(path, b"w", @stdio.stderr)
  let _ = @stdio.fputs(b"Hello, freopen!\n", @stdio.stderr)
  @stdio.fflush(@stdio.stderr)
  @stdio.fclose(@stdio.stderr)
  let file = @stdio.fopen(path, b"r")
  let buf : FixedArray[Byte] = FixedArray::make(1024, 0)
  let n = @stdio.fread(buf, 1024, file)
  @json.inspect(
    @encoding/utf8.decode(buf.unsafe_reinterpret_as_bytes()[0:n.to_int()]),
    content="Hello, freopen!\n",
  )
  @stdio.fclose(file)
  @stdio.remove(path)
}

///|
test "freopen/non-existent" {
  let path = b"non_existent_freopen_test.txt"
  let result = try? @stdio.freopen(path, b"r", @stdio.stderr)
  @json.inspect(result is Err(_), content=true)
}
