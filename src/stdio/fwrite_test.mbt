///|
test "fwrite[Bytes]" {
  let path = b"fwrite.txt"
  let file = @stdio.fopen(path, b"w")
  let n = @stdio.fwrite(b"Hello, world!", 13, file)
  @json.inspect(n, content="13")
  @json.inspect(@stdio.feof(file), content=false)
  @json.inspect(@stdio.ferror(file), content=false)
  @stdio.fclose(file)
  @stdio.remove(path)
}

///|
test "fwrite[FixedArray]" {
  let path = b"fwrite.txt"
  let file = @stdio.fopen(path, b"w")
  let buf = b"Hello, world!".to_fixedarray()
  let n = @stdio.fwrite(buf, buf.length().to_uint64(), file)
  @json.inspect(n, content="13")
  @json.inspect(@stdio.feof(file), content=false)
  @json.inspect(@stdio.ferror(file), content=false)
  @stdio.fclose(file)
  @stdio.remove(path)
}

///|
test "fwrite[@c.Pointer]" {
  let path = b"fwrite.txt"
  let file = @stdio.fopen(path, b"w")
  let buf = b"Hello, world!"
  let ptr : @c.Pointer[Byte] = @c.malloc(13)
  defer @c.free(ptr)
  for i in 0..<buf.length() {
    ptr[i.to_uint64()] = buf[i]
  }
  let n = @stdio.fwrite(ptr, 13, file)
  @json.inspect(n, content="13")
  @json.inspect(@stdio.feof(file), content=false)
  @json.inspect(@stdio.ferror(file), content=false)
  @stdio.fclose(file)
  @stdio.remove(path)
}
