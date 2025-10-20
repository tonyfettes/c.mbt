///|
test "compare_exchange_strong" {
  if !supports_atomics {
    return
  }
  let object : @c.Pointer[@atomic.Atomic[Int]] = @memory.calloc(1)
  @atomic.init_(object, 1)
  let expected : @c.Pointer[Int] = @memory.calloc(1)
  expected.store(1)
  @json.inspect(
    @atomic.compare_exchange_strong(object, expected, 2),
    content=true,
  )
  @json.inspect(@atomic.load(object), content=2)
  @json.inspect(
    @atomic.compare_exchange_strong(object, expected, 3),
    content=false,
  )
  @json.inspect(@atomic.load(object), content=2)
  @json.inspect(expected.load(), content=2)
}

///|
test "compare_exchange_weak" {
  if !supports_atomics {
    return
  }
  let object : @c.Pointer[@atomic.Atomic[Int]] = @memory.calloc(1)
  @atomic.init_(object, 1)
  let expected : @c.Pointer[Int] = @memory.calloc(1)
  expected.store(1)
  @json.inspect(
    @atomic.compare_exchange_weak(object, expected, 2),
    content=true,
  )
  @json.inspect(@atomic.load(object), content=2)
  @json.inspect(
    @atomic.compare_exchange_weak(object, expected, 3),
    content=false,
  )
  @json.inspect(@atomic.load(object), content=2)
  @json.inspect(expected.load(), content=2)
}
