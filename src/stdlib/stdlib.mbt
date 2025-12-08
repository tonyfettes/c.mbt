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
pub using @memory {malloc}

///|
pub using @memory {free}

///|
pub using @exit {exit}

///|
pub using @exit {atexit}

///|
pub using @memory {memcpy}

///|
pub using @memory {memcpy_from_bytes}

///|
pub using @memory {memcpy_to_bytes}

///|
extern "c" fn c_getenv(name : @c.Pointer[Byte]) -> @c.Pointer[Byte] = "getenv"

///|
pub fn[T : @c.BytesLike] getenv(name : T) -> @c.Pointer[Byte] {
  @c.borrow_bytes(name, ptr => c_getenv(ptr))
}

///|
extern "c" fn c_system(command : @c.Pointer[Byte]) -> Int = "system"

///|
pub fn[T : @c.BytesLike] system(command : T) -> Int {
  @c.borrow_bytes(command, ptr => c_system(ptr))
}
