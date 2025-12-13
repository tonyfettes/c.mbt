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
extern "c" fn string_strcmp(
  s1 : @pointer.Pointer[Byte],
  s2 : @pointer.Pointer[Byte],
) -> Int = "strcmp"

///|
pub fn[Str1 : Borrow, Str2 : Borrow] strcmp(s1 : Str1, s2 : Str2) -> Int {
  borrow_2(s1, s2, (s1, s2) => string_strcmp(s1, s2))
}
