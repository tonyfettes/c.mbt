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
struct ISize(Int64)

///|
pub fn ISize::from_int64(value : Int64) -> ISize {
  ISize(value)
}

///|
pub fn ISize::to_int64(self : ISize) -> Int64 {
  self.0
}

///|
struct USize(UInt64)

///|
pub fn USize::from_int64(value : UInt64) -> USize {
  USize(value)
}

///|
pub fn USize::to_int64(self : USize) -> UInt64 {
  self.0
}

///|
extern "c" fn sizeof_ssize() -> UInt64 = "moonbit_tonyfettes_c_sizeof_ssize_t"

///|
extern "c" fn sizeof_size_t() -> UInt64 = "moonbit_tonyfettes_c_sizeof_size_t"

///|
pub impl Sized for USize with size() -> UInt64 {
  sizeof_size_t()
}

///|
pub impl Sized for ISize with size() -> UInt64 {
  sizeof_ssize()
}
