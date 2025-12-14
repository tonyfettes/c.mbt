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
using @stddef {type Size, type Ptrdiff}

///|
pub const Bool = 1UL

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
pub(open) trait Sized {
  size() -> Size
}

///|
pub impl Sized for Bool with size() -> Size {
  1UL
}

///|
pub impl Sized for Byte with size() -> Size {
  1UL
}

///|
pub impl Sized for Int16 with size() -> Size {
  2UL
}

///|
pub impl Sized for UInt16 with size() -> Size {
  2UL
}

///|
pub impl Sized for Int with size() -> Size {
  4UL
}

///|
pub impl Sized for UInt with size() -> Size {
  4UL
}

///|
pub impl Sized for Int64 with size() -> Size {
  8UL
}

///|
pub impl Sized for UInt64 with size() -> Size {
  8UL
}

///|
pub impl Sized for Float with size() -> Size {
  4UL
}

///|
pub impl Sized for Double with size() -> Size {
  8UL
}

///|
pub impl Sized for Size with size() -> Size {
  Size::sizeof()
}

///|
pub impl Sized for @stddef.Ptrdiff with size() -> Size {
  Ptrdiff::sizeof()
}
