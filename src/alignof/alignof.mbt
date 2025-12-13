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
pub const Byte = 1UL

///|
pub const Int16 = 2UL

///|
pub const UInt16 = 2UL

///|
pub const Int = 4UL

///|
pub const UInt = 4UL

///|
pub const Int64 = 8UL

///|
pub const UInt64 = 8UL

///|
pub const Float = 4UL

///|
pub const Double = 8UL

///|
pub(open) trait Aligned {
  alignment() -> UInt64
}

///|
pub impl Aligned for Byte with alignment() -> UInt64 {
  1UL
}

///|
pub impl Aligned for Int16 with alignment() -> UInt64 {
  2UL
}

///|
pub impl Aligned for UInt16 with alignment() -> UInt64 {
  2UL
}

///|
pub impl Aligned for Int with alignment() -> UInt64 {
  4UL
}

///|
pub impl Aligned for UInt with alignment() -> UInt64 {
  4UL
}

///|
pub impl Aligned for Int64 with alignment() -> UInt64 {
  8UL
}

///|
pub impl Aligned for UInt64 with alignment() -> UInt64 {
  8UL
}

///|
pub impl Aligned for Float with alignment() -> UInt64 {
  4UL
}

///|
pub impl Aligned for Double with alignment() -> UInt64 {
  8UL
}
