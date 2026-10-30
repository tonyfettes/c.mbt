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
pub(open) trait Store {
  fn store(Pointer[Self], Self) -> Unit
}

///|
extern "c" fn pointer_store_bool(pointer : Pointer[Bool], value : Bool) = "moonbit_tonyfettes_c_pointer_store_bool"

///|
extern "c" fn pointer_store_byte(pointer : Pointer[Byte], value : Byte) = "moonbit_tonyfettes_c_pointer_store_byte"

///|
extern "c" fn pointer_store_int16(pointer : Pointer[Int16], value : Int16) = "moonbit_tonyfettes_c_pointer_store_int16"

///|
extern "c" fn pointer_store_uint16(pointer : Pointer[UInt16], value : UInt16) = "moonbit_tonyfettes_c_pointer_store_uint16"

///|
extern "c" fn pointer_store_int(pointer : Pointer[Int32], value : Int32) = "moonbit_tonyfettes_c_pointer_store_int"

///|
extern "c" fn pointer_store_uint(pointer : Pointer[UInt32], value : UInt32) = "moonbit_tonyfettes_c_pointer_store_uint"

///|
extern "c" fn pointer_store_int64(pointer : Pointer[Int64], value : Int64) = "moonbit_tonyfettes_c_pointer_store_int64"

///|
extern "c" fn pointer_store_uint64(pointer : Pointer[UInt64], value : UInt64) = "moonbit_tonyfettes_c_pointer_store_uint64"

///|
extern "c" fn pointer_store_float(pointer : Pointer[Float], value : Float) = "moonbit_tonyfettes_c_pointer_store_float"

///|
extern "c" fn pointer_store_double(pointer : Pointer[Double], value : Double) = "moonbit_tonyfettes_c_pointer_store_double"

///|
extern "c" fn pointer_store_pointer(
  pointer : Pointer[Pointer[Unit]],
  value : Pointer[Unit],
) = "moonbit_tonyfettes_c_pointer_store_pointer"

///|
extern "c" fn pointer_store_ptrdiff(
  pointer : Pointer[@stddef.Ptrdiff],
  value : @stddef.Ptrdiff,
) = "moonbit_tonyfettes_c_pointer_store_ptrdiff"

///|
extern "c" fn pointer_store_size(
  pointer : Pointer[@stddef.Size],
  value : @stddef.Size,
) = "moonbit_tonyfettes_c_pointer_store_size"

///|
pub impl Store for Bool with fn store(pointer : Pointer[Bool], value : Bool) -> Unit {
  pointer_store_bool(pointer, value)
}

///|
pub impl Store for Byte with fn store(pointer : Pointer[Byte], value : Byte) -> Unit {
  pointer_store_byte(pointer, value)
}

///|
pub impl Store for Int16 with fn store(pointer : Pointer[Int16], value : Int16) -> Unit {
  pointer_store_int16(pointer, value)
}

///|
pub impl Store for UInt16 with fn store(
  pointer : Pointer[UInt16],
  value : UInt16,
) -> Unit {
  pointer_store_uint16(pointer, value)
}

///|
pub impl Store for Int32 with fn store(pointer : Pointer[Int32], value : Int32) -> Unit {
  pointer_store_int(pointer, value)
}

///|
pub impl Store for UInt32 with fn store(
  pointer : Pointer[UInt32],
  value : UInt32,
) -> Unit {
  pointer_store_uint(pointer, value)
}

///|
pub impl Store for Int64 with fn store(pointer : Pointer[Int64], value : Int64) -> Unit {
  pointer_store_int64(pointer, value)
}

///|
pub impl Store for UInt64 with fn store(
  pointer : Pointer[UInt64],
  value : UInt64,
) -> Unit {
  pointer_store_uint64(pointer, value)
}

///|
pub impl Store for Float with fn store(pointer : Pointer[Float], value : Float) -> Unit {
  pointer_store_float(pointer, value)
}

///|
pub impl Store for Double with fn store(
  pointer : Pointer[Double],
  value : Double,
) -> Unit {
  pointer_store_double(pointer, value)
}

///|
pub impl[T] Store for Pointer[T] with fn store(
  pointer : Pointer[Pointer[T]],
  value : Pointer[T],
) -> Unit {
  pointer_store_pointer(pointer.cast(), value.cast())
}

///|
pub impl Store for @stddef.Ptrdiff with fn store(
  pointer : Pointer[@stddef.Ptrdiff],
  value : @stddef.Ptrdiff,
) -> Unit {
  pointer_store_ptrdiff(pointer, value)
}

///|
pub impl Store for @stddef.Size with fn store(
  pointer : Pointer[@stddef.Size],
  value : @stddef.Size,
) -> Unit {
  pointer_store_size(pointer, value)
}
