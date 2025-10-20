///|
test "strerror" {
  let str = strerror(@errno.edom)
  @json.inspect(str.is_not_null(), content=true)
  let str = strerror(@errno.erange)
  @json.inspect(str.is_not_null(), content=true)
}

///|
test "Errno/Show" {
  let error = @errno.Errno(@errno.edom)
  @json.inspect(error.to_string().length() > 0, content=true)
  let error = @errno.Errno(@errno.erange)
  @json.inspect(error.to_string().length() > 0, content=true)
}

///|
test "Errno/ToJson" {
  let error = @errno.Errno(@errno.edom)
  let json = error.to_json()
  @json.inspect(
    json is ["Errno", [errno, _]] && errno == @errno.edom.to_json(),
    content=true,
  )
  let error = @errno.Errno(@errno.erange)
  let json = error.to_json()
  @json.inspect(
    json is ["Errno", [errno, _]] && errno == @errno.erange.to_json(),
    content=true,
  )
}
