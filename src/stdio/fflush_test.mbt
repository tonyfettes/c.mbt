///|
test "fflush/error" {
  let file = @stdio.fopen(b"fflush_text.txt", b"w")
  @stdio.fflush(file)
  @stdio.fclose(file)
  @stdio.remove(b"fflush_text.txt")
}
