///|
test "fread[FixedArray[_]]" {
  let file = @stdio.fopen(b"moon.mod.json", b"r")
  let buf : FixedArray[Byte] = FixedArray::make(1024, 0)
  let n = @stdio.fread(buf, 1024, file)
  @json.inspect(n, content="391")
  @json.inspect(@stdio.feof(file), content=true)
  @json.inspect(@stdio.ferror(file), content=false)
  @stdio.fclose(file)
}

///|
test "fread[@c.Pointer[_]]" {
  let file = @stdio.fopen(b"moon.mod.json", b"r")
  let buf : @c.Pointer[Byte] = @memory.malloc(1024)
  defer @memory.free(buf)
  let n = @stdio.fread(buf, 1024, file)
  @json.inspect(n, content="391")
  @json.inspect(@stdio.feof(file), content=true)
  @json.inspect(@stdio.ferror(file), content=false)
  @stdio.fclose(file)
}
