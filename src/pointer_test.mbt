///|
test "Pointer::null" {
  let ptr : @c.Ptr[Unit] = @c.Ptr::null()
  @json.inspect(ptr.is_null(), content=true)
  @json.inspect(ptr.is_not_null(), content=false)
}

///|
test "Pointer::add" {
  let ptr : @c.Ptr[Byte] = @c.Ptr::null()
  @json.inspect(ptr.to_uint64(), content="0")
  @json.inspect(ptr.add(0x10).to_uint64(), content="16")
  @json.inspect(ptr.add(0x20).sub(0x10).to_uint64(), content="16")
}

///|
test "Pointer::equal" {
  let ptr1 : @c.Ptr[Byte] = @c.Ptr::null()
  let ptr2 : @c.Ptr[Byte] = @c.Ptr::null()
  let ptr3 : @c.Ptr[Byte] = ptr1.add(0x10)
  @json.inspect(ptr1.equal(ptr2), content=true)
  @json.inspect(ptr1.equal(ptr3), content=false)
}

///|
test "Pointer::compare" {
  let ptr1 : @c.Ptr[Byte] = @c.Ptr::null()
  let ptr2 : @c.Ptr[Byte] = ptr1.add(0x10)
  @json.inspect(ptr1.compare(ptr2), content=-1)
  @json.inspect(ptr2.compare(ptr1), content=1)
  @json.inspect(ptr1.compare(ptr1), content=0)
}

///|
test "Pointer::offset" {
  let ptr : @c.Ptr[Byte] = @c.Ptr::null()
  @json.inspect(ptr.offset(0x20).to_uint64(), content="32")
}

///|
test "Pointer::offset_from" {
  let ptr : @c.Ptr[Byte] = @c.Ptr::null()
  @json.inspect(ptr.add(0x30).offset_from(ptr.add(0x10)), content="32")
}

///|
test "Pointer[Byte]" {
  let val : Byte = 0x42
  let ptr : @c.Ptr[Byte] = @memory.malloc(@c.sizeof(val))
  defer @memory.free(ptr)
  ptr.store(val)
  @json.inspect(ptr.load(), content=val.to_json())
}

///|
test "Pointer[Int16]" {
  let val : Int16 = 0x1234
  let ptr : @c.Ptr[Int16] = @memory.malloc(@c.sizeof(val))
  defer @memory.free(ptr)
  ptr.store(val)
  @json.inspect(ptr.load(), content=val.to_json())
}

///|
test "Pointer[UInt16]" {
  let val : UInt16 = 0x1234
  let ptr : @c.Ptr[UInt16] = @memory.malloc(@c.sizeof(val))
  defer @memory.free(ptr)
  ptr.store(val)
  @json.inspect(ptr.load(), content=val.to_json())
}

///|
test "Pointer[Int]" {
  let val : Int = 0x12345678
  let ptr : @c.Ptr[Int] = @memory.malloc(@c.sizeof(val))
  defer @memory.free(ptr)
  ptr.store(val)
  @json.inspect(ptr.load(), content=val.to_json())
}

///|
test "Pointer[UInt]" {
  let val : UInt = 0x12345678
  let ptr : @c.Ptr[UInt] = @memory.malloc(@c.sizeof(val))
  defer @memory.free(ptr)
  ptr.store(val)
  @json.inspect(ptr.load(), content=val.to_json())
}

///|
test "Pointer[Int64]" {
  let val : Int64 = 0x1234567890abcdef
  let ptr : @c.Ptr[Int64] = @memory.malloc(@c.sizeof(val))
  defer @memory.free(ptr)
  ptr.store(val)
  @json.inspect(ptr.load(), content=val.to_json())
}

///|
test "Pointer[UInt64]" {
  let val : UInt64 = 0x1234567890abcdef
  let ptr : @c.Ptr[UInt64] = @memory.malloc(@c.sizeof(val))
  defer @memory.free(ptr)
  ptr.store(val)
  @json.inspect(ptr.load(), content=val.to_json())
}

///|
test "Pointer[Float]" {
  let val : Float = 3.14159
  let ptr : @c.Ptr[Float] = @memory.malloc(@c.sizeof(val))
  defer @memory.free(ptr)
  ptr.store(val)
  @json.inspect(ptr.load(), content=val.to_json())
}

///|
test "Pointer[Double]" {
  let val : Double = 3.141592653589793
  let ptr : @c.Ptr[Double] = @memory.malloc(@c.sizeof(val))
  defer @memory.free(ptr)
  ptr.store(val)
  @json.inspect(ptr.load(), content=val.to_json())
}

///|
test "Pointer[Pointer[_]]" {
  let val : @c.Ptr[Byte] = @memory.malloc(16)
  defer @memory.free(val)
  let ptr : @c.Ptr[@c.Ptr[Byte]] = @memory.malloc(@c.sizeof(val))
  defer @memory.free(ptr)
  ptr.store(val)
  @json.inspect(ptr.load() == val, content=true)
}
