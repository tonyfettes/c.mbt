///|
test "fetch_sub" {
  if !supports_atomics {
    return
  }
  let object : @c.Pointer[@atomic.Atomic[Int]] = @memory.calloc(1)
  @atomic.init_(object, 3)
  @json.inspect(@atomic.fetch_sub(object, 1), content=3)
  @json.inspect(@atomic.load(object), content=2)
}
