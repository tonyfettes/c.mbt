///|
test "store" {
  let ptr : @c.Pointer[@atomic.Atomic[Int]] = @memory.calloc(1)
  @atomic.init_(ptr, 0)
  @json.inspect(@atomic.load(ptr), content=0)
  @atomic.store(ptr, 1)
  @json.inspect(@atomic.load(ptr), content=1)
}
