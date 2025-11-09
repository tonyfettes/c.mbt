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
extern "c" fn atomic_sizeof_int() -> UInt64 = "moonbit_tonyfettes_c_atomic_sizeof_int"

///|
pub(open) trait Sizeof {
  sizeof() -> UInt64
}

///|
pub impl Sizeof for Int with sizeof() -> UInt64 {
  atomic_sizeof_int()
}

///|
pub impl[T : Sizeof] @c.Sizeof for Atomic[T] with sizeof() -> UInt64 {
  T::sizeof()
}
