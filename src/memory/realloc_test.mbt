///|
test "realloc" {
  let ptr : @c.Pointer[Int] = @memory.malloc(10 * @c.sizeof(Int::default()))
  for i in 0UL..<10 {
    ptr[i] = i.to_int()
  }
  let new_ptr = @memory.realloc(ptr, 20 * @c.sizeof(Int::default()))
  defer @memory.free(new_ptr)
  for i in 0UL..<10 {
    @json.inspect(new_ptr[i], content=i.to_int().to_json())
  }
  for i in 10UL..<20 {
    @json.inspect(new_ptr[i], content=0)
  }
}
