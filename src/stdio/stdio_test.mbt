///|
test "stdio" {
  @json.inspect(@stdio.eof, content=-1)
  @json.inspect(@stdio.stdin.is_not_null(), content=true)
  @json.inspect(@stdio.stdout.is_not_null(), content=true)
  @json.inspect(@stdio.stderr.is_not_null(), content=true)
}
