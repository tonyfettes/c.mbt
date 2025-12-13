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
pub(open) trait Load {
  load(Pointer[Self]) -> Self
}

///|
extern "c" fn pointer_load_bool(pointer : Pointer[Bool]) -> Bool = "moonbit_tonyfettes_c_pointer_load_bool"

///|
extern "c" fn pointer_load_byte(pointer : Pointer[Byte]) -> Byte = "moonbit_tonyfettes_c_pointer_load_byte"

///|
extern "c" fn pointer_load_int16(pointer : Pointer[Int16]) -> Int16 = "moonbit_tonyfettes_c_pointer_load_int16"

///|
extern "c" fn pointer_load_uint16(pointer : Pointer[UInt16]) -> UInt16 = "moonbit_tonyfettes_c_pointer_load_uint16"

///|
extern "c" fn pointer_load_int(pointer : Pointer[Int]) -> Int = "moonbit_tonyfettes_c_pointer_load_int"

///|
extern "c" fn pointer_load_uint(pointer : Pointer[UInt]) -> UInt = "moonbit_tonyfettes_c_pointer_load_uint"

///|
extern "c" fn pointer_load_int64(pointer : Pointer[Int64]) -> Int64 = "moonbit_tonyfettes_c_pointer_load_int64"

///|
extern "c" fn pointer_load_uint64(pointer : Pointer[UInt64]) -> UInt64 = "moonbit_tonyfettes_c_pointer_load_uint64"

///|
extern "c" fn pointer_load_float(pointer : Pointer[Float]) -> Float = "moonbit_tonyfettes_c_pointer_load_float"

///|
extern "c" fn pointer_load_double(pointer : Pointer[Double]) -> Double = "moonbit_tonyfettes_c_pointer_load_double"

///|
extern "c" fn pointer_load_pointer(
  pointer : Pointer[Pointer[Unit]],
) -> Pointer[Unit] = "moonbit_tonyfettes_c_pointer_load_pointer"

///|
pub impl Load for Bool with load(pointer : Pointer[Bool]) -> Bool {
  pointer_load_bool(pointer)
}

///|
pub impl Load for Byte with load(pointer : Pointer[Byte]) -> Byte {
  pointer_load_byte(pointer)
}

///|
pub impl Load for Int16 with load(pointer : Pointer[Int16]) -> Int16 {
  pointer_load_int16(pointer)
}

///|
pub impl Load for UInt16 with load(pointer : Pointer[UInt16]) -> UInt16 {
  pointer_load_uint16(pointer)
}

///|
pub impl Load for Int with load(pointer : Pointer[Int]) -> Int {
  pointer_load_int(pointer)
}

///|
pub impl Load for UInt with load(pointer : Pointer[UInt]) -> UInt {
  pointer_load_uint(pointer)
}

///|
pub impl Load for Int64 with load(pointer : Pointer[Int64]) -> Int64 {
  pointer_load_int64(pointer)
}

///|
pub impl Load for UInt64 with load(pointer : Pointer[UInt64]) -> UInt64 {
  pointer_load_uint64(pointer)
}

///|
pub impl Load for Float with load(pointer : Pointer[Float]) -> Float {
  pointer_load_float(pointer)
}

///|
pub impl Load for Double with load(pointer : Pointer[Double]) -> Double {
  pointer_load_double(pointer)
}

///|
pub impl[T] Load for Pointer[T] with load(pointer : Pointer[Pointer[T]]) -> Pointer[
  T,
] {
  pointer_load_pointer(pointer.cast()).cast()
}
