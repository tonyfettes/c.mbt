///|
test "fgets" {
  let file = @stdio.fopen(b"fgets_text.txt", b"w")
  let _ = @stdio.fputs(b"Hello, Moonbit!\nHello, World!\n", file)
  @stdio.fclose(file)
  let file = @stdio.fopen(b"fgets_text.txt", b"r")
  let buf : FixedArray[Byte] = FixedArray::make(64, 0)
  @json.inspect(@stdio.fgets(buf, 64, file) is Some(_), content=true)
  let buf = buf.unsafe_reinterpret_as_bytes()
  @json.inspect(buf is [.. "Hello, Moonbit!\n", ..], content=true)
  @stdio.fclose(file)
  @stdio.remove(b"fgets_text.txt")
}

///|
test "fgets/eof" {
  let file = @stdio.fopen(b"fgets_eof.txt", b"w")
  let _ = @stdio.fputs(b"EOF", file)
  @stdio.fclose(file)
  let file = @stdio.fopen(b"fgets_eof.txt", b"r")
  let buf : FixedArray[Byte] = FixedArray::make(16, 0)
  @json.inspect(@stdio.fgets(buf, 16, file) is Some(_), content=true)
  @json.inspect(@stdio.fgets(buf, 16, file) is None, content=true)
  @stdio.fclose(file)
  @stdio.remove(b"fgets_eof.txt")
}
