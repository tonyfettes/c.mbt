// Copyright 2025 International Digital Economy Academy
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

///|
test "Pointer::null" {
  let ptr : @pointer.Pointer[Unit] = @pointer.Pointer::null()
  @json.inspect(ptr.is_null(), content=true)
  @json.inspect(ptr.is_not_null(), content=false)
}

///|
test "Pointer::add" {
  let ptr : @pointer.Pointer[Byte] = @pointer.Pointer::null()
  @json.inspect(ptr.to_uint64(), content="0")
  @json.inspect(ptr.offset(0x10).to_uint64(), content="16")
  @json.inspect(ptr.offset(0x20).offset(-0x10).to_uint64(), content="16")
}

///|
test "Pointer::equal" {
  let ptr1 : @pointer.Pointer[Byte] = @pointer.Pointer::null()
  let ptr2 : @pointer.Pointer[Byte] = @pointer.Pointer::null()
  let ptr3 : @pointer.Pointer[Byte] = ptr1.offset(0x10)
  @json.inspect(ptr1.equal(ptr2), content=true)
  @json.inspect(ptr1.equal(ptr3), content=false)
}

///|
test "Pointer::compare" {
  let ptr1 : @pointer.Pointer[Byte] = @pointer.Pointer::null()
  let ptr2 : @pointer.Pointer[Byte] = ptr1.offset(0x10)
  @json.inspect(ptr1.compare(ptr2), content=-1)
  @json.inspect(ptr2.compare(ptr1), content=1)
  @json.inspect(ptr1.compare(ptr1), content=0)
}

///|
test "Pointer::offset" {
  let ptr : @pointer.Pointer[Byte] = @pointer.Pointer::null()
  @json.inspect(ptr.offset(0x20).to_uint64(), content="32")
}

///|
test "Pointer::offset_from" {
  let ptr : @pointer.Pointer[Byte] = @pointer.Pointer::null()
  @json.inspect(ptr.offset(0x30).offset_from(ptr.offset(0x10)), content="32")
  @json.inspect(ptr.offset(0x10).offset_from(ptr.offset(0x30)), content="-32")
}

///|
test "Pointer[Byte]" {
  let val : Byte = 0x42
  let ptr : @pointer.Pointer[Byte] = @memory.malloc(
    @sizeof.sizeof((ignore : (Byte) -> Unit)),
  )
  defer @memory.free(ptr)
  ptr.store(val)
  @json.inspect(ptr.load(), content=val.to_json())
}

///|
test "Pointer[Int16]" {
  let val : Int16 = 0x1234
  let ptr : @pointer.Pointer[Int16] = @memory.malloc(
    @sizeof.sizeof((ignore : (Int16) -> Unit)),
  )
  defer @memory.free(ptr)
  ptr.store(val)
  @json.inspect(ptr.load(), content=val.to_json())
}

///|
test "Pointer[UInt16]" {
  let val : UInt16 = 0x1234
  let ptr : @pointer.Pointer[UInt16] = @memory.malloc(
    @sizeof.sizeof((ignore : (UInt16) -> Unit)),
  )
  defer @memory.free(ptr)
  ptr.store(val)
  @json.inspect(ptr.load(), content=val.to_json())
}

///|
test "Pointer[Int]" {
  let val : Int = 0x12345678
  let ptr : @pointer.Pointer[Int] = @memory.malloc(
    @sizeof.sizeof((ignore : (Int) -> Unit)),
  )
  defer @memory.free(ptr)
  ptr.store(val)
  @json.inspect(ptr.load(), content=val.to_json())
}

///|
test "Pointer[UInt]" {
  let val : UInt = 0x12345678
  let ptr : @pointer.Pointer[UInt] = @memory.malloc(
    @sizeof.sizeof((ignore : (UInt) -> Unit)),
  )
  defer @memory.free(ptr)
  ptr.store(val)
  @json.inspect(ptr.load(), content=val.to_json())
}

///|
test "Pointer[Int64]" {
  let val : Int64 = 0x1234567890abcdef
  let ptr : @pointer.Pointer[Int64] = @memory.malloc(
    @sizeof.sizeof((ignore : (Int64) -> Unit)),
  )
  defer @memory.free(ptr)
  ptr.store(val)
  @json.inspect(ptr.load(), content=val.to_json())
}

///|
test "Pointer[UInt64]" {
  let val : UInt64 = 0x1234567890abcdef
  let ptr : @pointer.Pointer[UInt64] = @memory.malloc(
    @sizeof.sizeof((ignore : (UInt64) -> Unit)),
  )
  defer @memory.free(ptr)
  ptr.store(val)
  @json.inspect(ptr.load(), content=val.to_json())
}

///|
test "Pointer[Float]" {
  let val : Float = 3.14159
  let ptr : @pointer.Pointer[Float] = @memory.malloc(
    @sizeof.sizeof((ignore : (Float) -> Unit)),
  )
  defer @memory.free(ptr)
  ptr.store(val)
  @json.inspect(ptr.load(), content=val.to_json())
}

///|
test "Pointer[Double]" {
  let val : Double = 3.141592653589793
  let ptr : @pointer.Pointer[Double] = @memory.malloc(
    @sizeof.sizeof((ignore : (Double) -> Unit)),
  )
  defer @memory.free(ptr)
  ptr.store(val)
  @json.inspect(ptr.load(), content=val.to_json())
}

///|
test "Pointer[Pointer[_]]" {
  let val : @pointer.Pointer[Byte] = @memory.malloc(16)
  defer @memory.free(val)
  let ptr : @pointer.Pointer[@pointer.Pointer[Byte]] = @memory.malloc(
    @sizeof.sizeof((ignore : (@pointer.Pointer[Byte]) -> Unit)),
  )
  defer @memory.free(ptr)
  ptr.store(val)
  @json.inspect(ptr.load() == val, content=true)
}

///|
test "borrow_ref" {
  let val : Ref[Int] = Ref::new(42)
  @pointer.borrow_ref(val, ptr => @json.inspect(ptr.load(), content=42))
}

///|
test "borrow_array" {
  let arr : FixedArray[Int] = [1, 2, 3, 4, 5]
  @pointer.borrow_array(arr, ptr => for i in 0UL..<arr.length().to_uint64() {
    assert_eq(ptr[i], i.to_int() + 1)
  })
}

///|
test "borrow_bytes" {
  let bytes = b"Hello"
  @pointer.borrow_bytes(bytes, ptr => {
    assert_eq(ptr[0], 'H')
    assert_eq(ptr[1], 'e')
    assert_eq(ptr[2], 'l')
    assert_eq(ptr[3], 'l')
    assert_eq(ptr[4], 'o')
    assert_eq(ptr[5], 0)
  })
}
