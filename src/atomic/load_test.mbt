///|
test "load" {
  if !supports_atomics {
    return
  }
  let ptr : @c.Pointer[@atomic.Atomic[Int]] = @memory.calloc(1)
  @atomic.init_(ptr, 0)
  @json.inspect(@atomic.load(ptr), content=0)
}
