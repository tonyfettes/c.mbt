///|
test "fread" {
  let file = @stdio.fopen(b"moon.mod.json", b"r")
  let buf = FixedArray::make(1024, 0)
  let n = @stdio.fread(buf, 1024, file)
  @json.inspect(n, content="97")
  @json.inspect(@stdio.feof(file), content=true)
  @json.inspect(@stdio.ferror(file), content=false)
  @stdio.fclose(file)
}
