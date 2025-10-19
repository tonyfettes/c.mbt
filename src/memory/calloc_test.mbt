///|
test "calloc" {
  let ptr : @c.Pointer[Int] = @memory.calloc(10)
  defer @memory.free(ptr)
  for i in 0UL..<10 {
    @json.inspect(ptr[i], content=0)
  }
}
