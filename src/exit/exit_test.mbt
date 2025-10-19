///|
test "exit_code" {
  @json.inspect(@exit.success, content=0)
  @json.inspect(@exit.failure, content=1)
}
