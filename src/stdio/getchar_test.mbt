///|
test "getchar" {
  let c = @stdio.getchar()
  @json.inspect(c, content=@stdio.eof.to_json())
  let file = @stdio.fopen(b"getchar_test.txt", b"w")
  let _ = @stdio.fwrite(b"A", 1, file)
  @stdio.fclose(file)
  let _ = @stdio.freopen(b"getchar_test.txt", b"r", @stdio.stdin)
  let c = @stdio.getchar()
  @json.inspect(c, content=65)
  @stdio.remove(b"getchar_test.txt")
}
