///|
test "exit_code" {
  @json.inspect(@c.exit_success, content=0)
  @json.inspect(@c.exit_failure, content=1)
}
