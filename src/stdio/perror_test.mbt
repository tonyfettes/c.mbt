///|
test "perror" {
  @errno.set(0)
  let _ = @stdio.freopen(b"perror_test.txt", b"w", @stdio.stderr)
  @stdio.perror(b"Test perror message")
  @stdio.fflush(@stdio.stderr)
  let file = @stdio.fopen(b"perror_test.txt", b"r")
  let buf : FixedArray[Byte] = FixedArray::make(1024, 0)
  let n = @stdio.fread(buf, 1024, file)
  let output = @encoding/utf8.decode(
    buf.unsafe_reinterpret_as_bytes()[0:n.to_int()],
  )
  @json.inspect(output.contains("Test perror message"), content=true)
  @stdio.fclose(file)
  @stdio.remove(b"perror_test.txt")
}
