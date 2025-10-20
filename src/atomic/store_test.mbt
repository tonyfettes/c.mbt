///|
test "store" {
  if !supports_atomics {
    return
  }
  let object : @c.Pointer[@atomic.Atomic[Int]] = @memory.calloc(1)
  @atomic.init_(object, 0)
  @json.inspect(@atomic.load(object), content=0)
  @atomic.store(object, 1)
  @json.inspect(@atomic.load(object), content=1)
}
