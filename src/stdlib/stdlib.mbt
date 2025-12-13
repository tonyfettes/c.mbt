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
pub using @exit {exit, atexit}

///|
pub using @memory {malloc, free, memcpy, memcpy_from_bytes, memcpy_to_bytes}

///|
extern "c" fn c_getenv(name : @pointer.Pointer[Byte]) -> @pointer.Pointer[Byte] = "getenv"

///|
pub fn[T : @string.Borrow] getenv(name : T) -> @pointer.Pointer[Byte] {
  @string.borrow(name, ptr => c_getenv(ptr))
}

///|
extern "c" fn c_system(command : @pointer.Pointer[Byte]) -> Int = "system"

///|
pub fn[T : @string.Borrow] system(command : T) -> Int {
  @string.borrow(command, ptr => c_system(ptr))
}
