test "fflush/error" {
  let file = @stdio.fopen(b"fflush_text.txt", b"w")
  @stdio.fclose(file)
  @json.inspect((try? @stdio.fflush(file)) is Err(_), content=true)
  @stdio.remove(b"fflush_text.txt")
}
