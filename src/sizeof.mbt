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
pub(open) trait Sizeof {
  sizeof() -> UInt64
}

///|
pub impl Sizeof for Byte with sizeof() -> UInt64 {
  1
}

///|
pub impl Sizeof for Int16 with sizeof() -> UInt64 {
  2
}

///|
pub impl Sizeof for UInt16 with sizeof() -> UInt64 {
  2
}

///|
pub impl Sizeof for Int with sizeof() -> UInt64 {
  4
}

///|
pub impl Sizeof for UInt with sizeof() -> UInt64 {
  4
}

///|
pub impl Sizeof for Int64 with sizeof() -> UInt64 {
  8
}

///|
pub impl Sizeof for UInt64 with sizeof() -> UInt64 {
  8
}

///|
pub impl Sizeof for Float with sizeof() -> UInt64 {
  4
}

///|
pub impl Sizeof for Double with sizeof() -> UInt64 {
  8
}

///|
pub fn[T : Sizeof] sizeof(_ : T) -> UInt64 {
  T::sizeof()
}
