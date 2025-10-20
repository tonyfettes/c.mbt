///|
test "exchange" {
  if @feature.no_atomics {
    return
  }
  let ptr : @c.Pointer[@atomic.Atomic[Int]] = @memory.calloc(1)
  @atomic.init_(ptr, 0)
  @json.inspect(@atomic.exchange(ptr, 1), content=0)
  @json.inspect(@atomic.load(ptr), content=1)
}
