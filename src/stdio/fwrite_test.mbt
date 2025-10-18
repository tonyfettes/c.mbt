///|
test "fwrite" {
  let path = b"fwrite.txt"
  let file = @stdio.fopen(path, b"w")
  let n = @stdio.fwrite(b"Hello, world!", 13, file)
  @json.inspect(n, content="13")
  @json.inspect(@stdio.feof(file), content=false)
  @json.inspect(@stdio.ferror(file), content=false)
  @stdio.fclose(file)
  @stdio.remove(path)
}
