///|
test "remove" {
  let file = @stdio.fopen(b"remove_test.txt", b"w")
  let _ = @stdio.fwrite(b"Test data", 9, file)
  @stdio.fclose(file)
  @stdio.remove(b"remove_test.txt")
}

///|
test "remove/non-existent" {
  @json.inspect(
    (try? @stdio.remove(b"non_existent_file.txt")) is Err(_),
    content=true,
  )
}
