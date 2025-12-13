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
#valtype
struct Type {
  size : UInt64
  align : UInt64
} derive(Show, ToJson)

///|
pub fn Type::new(size~ : UInt64, align~ : UInt64) -> Type {
  Type::{ size, align }
}

///|
pub fn Type::size(self : Type) -> UInt64 {
  self.size
}

///|
pub fn Type::align(self : Type) -> UInt64 {
  self.align
}

///|
pub let byte : Type = Type::{ size: 1, align: 1 }

///|
pub let int16 : Type = Type::{ size: 2, align: 2 }

///|
pub let uint16 : Type = Type::{ size: 2, align: 2 }

///|
pub let int : Type = Type::{ size: 4, align: 4 }

///|
pub let uint : Type = Type::{ size: 4, align: 4 }

///|
pub let int64 : Type = Type::{ size: 8, align: 8 }

///|
pub let uint64 : Type = Type::{ size: 8, align: 8 }

///|
pub let float : Type = Type::{ size: 4, align: 4 }

///|
pub let double : Type = Type::{ size: 8, align: 8 }

///|
pub let pointer : Type = {
  let size = @pointer.Pointer::sizeof()
  { size, align: size }
}
