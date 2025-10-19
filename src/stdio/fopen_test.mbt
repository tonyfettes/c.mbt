///|
test "fopen/non-existent" {
  @json.inspect(
    (try? @stdio.fopen(b"non_existent_file.txt", b"r")) is Err(_),
    content=true,
  )
}
