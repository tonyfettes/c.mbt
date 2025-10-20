///|
test "fetch_or" {
  if @feature.no_atomics {
    return
  }
  let object : @c.Pointer[@atomic.Atomic[Int]] = @memory.calloc(1)
  @atomic.init_(object, 2)
  @json.inspect(@atomic.fetch_or(object, 1), content=2)
  @json.inspect(@atomic.load(object), content=3)
}
