///|
test "freopen" {
  let path = b"freopen_test.txt"
  let file = @stdio.fopen(path, b"w")
  let redirect_path = b"freopen_redirect.txt"
  let _ = @stdio.freopen(redirect_path, b"w", file)
  let _ = @stdio.fputs(b"Hello, freopen!\n", file)
  @stdio.fflush(file)
  @stdio.fclose(file)
  let file = @stdio.fopen(path, b"r")
  let buf : FixedArray[Byte] = FixedArray::make(1024, 0)
  let n = @stdio.fread(buf, 1024, file)
  @json.inspect(
    @encoding/utf8.decode(buf.unsafe_reinterpret_as_bytes()[0:n.to_int()]),
    content="",
  )
  let redirect_file = @stdio.fopen(redirect_path, b"r")
  let n = @stdio.fread(buf, 1024, redirect_file)
  @json.inspect(
    @encoding/utf8.decode(buf.unsafe_reinterpret_as_bytes()[0:n.to_int()]),
    content="Hello, freopen!\n",
  )
  @stdio.fclose(file)
  @stdio.remove(path)
  @stdio.remove(redirect_path)
}

///|
test "freopen/non-existent" {
  let path = b"non_existent_freopen_test.txt"
  let result = try? @stdio.freopen(path, b"r", @stdio.stdin)
  @json.inspect(result is Err(_), content=true)
}
