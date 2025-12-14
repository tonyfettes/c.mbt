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
trait Aligned {
  alignment() -> @stddef.Size
}

///|
pub impl Aligned for Bool with alignment() -> @stddef.Size {
  1UL
}

///|
pub impl Aligned for Byte with alignment() -> @stddef.Size {
  1UL
}

///|
pub impl Aligned for Int16 with alignment() -> @stddef.Size {
  2UL
}

///|
pub impl Aligned for UInt16 with alignment() -> @stddef.Size {
  2UL
}

///|
pub impl Aligned for Int with alignment() -> @stddef.Size {
  4UL
}

///|
pub impl Aligned for UInt with alignment() -> @stddef.Size {
  4UL
}

///|
pub impl Aligned for Int64 with alignment() -> @stddef.Size {
  8UL
}

///|
pub impl Aligned for UInt64 with alignment() -> @stddef.Size {
  8UL
}

///|
pub impl Aligned for Float with alignment() -> @stddef.Size {
  4UL
}

///|
pub impl Aligned for Double with alignment() -> @stddef.Size {
  8UL
}

///|
pub impl[T] Aligned for @pointer.Pointer[T] with alignment() -> @stddef.Size {
  @pointer.sizeof()
}
