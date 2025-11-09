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
extern "c" fn ctype_isalnum(c : Int) -> Int = "isalnum"

///|
pub fn isalnum(c : Byte) -> Bool {
  ctype_isalnum(c.to_int()) != 0
}

///|
extern "c" fn ctype_isalpha(c : Int) -> Int = "isalpha"

///|
pub fn isalpha(c : Byte) -> Bool {
  ctype_isalpha(c.to_int()) != 0
}

///|
extern "c" fn ctype_islower(c : Int) -> Int = "islower"

///|
pub fn islower(c : Byte) -> Bool {
  ctype_islower(c.to_int()) != 0
}

///|
extern "c" fn ctype_isupper(c : Int) -> Int = "isupper"

///|
pub fn isupper(c : Byte) -> Bool {
  ctype_isupper(c.to_int()) != 0
}

///|
extern "c" fn ctype_isdigit(c : Int) -> Int = "isdigit"

///|
pub fn isdigit(c : Byte) -> Bool {
  ctype_isdigit(c.to_int()) != 0
}

///|
extern "c" fn ctype_isxdigit(c : Int) -> Int = "isxdigit"

///|
pub fn isxdigit(c : Byte) -> Bool {
  ctype_isxdigit(c.to_int()) != 0
}

///|
extern "c" fn ctype_iscntrl(c : Int) -> Int = "iscntrl"

///|
pub fn iscntrl(c : Byte) -> Bool {
  ctype_iscntrl(c.to_int()) != 0
}

///|
extern "c" fn ctype_isgraph(c : Int) -> Int = "isgraph"

///|
pub fn isgraph(c : Byte) -> Bool {
  ctype_isgraph(c.to_int()) != 0
}

///|
extern "c" fn ctype_isblank(c : Int) -> Int = "isblank"

///|
pub fn isblank(c : Byte) -> Bool {
  ctype_isblank(c.to_int()) != 0
}

///|
extern "c" fn ctype_isspace(c : Int) -> Int = "isspace"

///|
pub fn isspace(c : Byte) -> Bool {
  ctype_isspace(c.to_int()) != 0
}

///|
extern "c" fn ctype_isprint(c : Int) -> Int = "isprint"

///|
pub fn isprint(c : Byte) -> Bool {
  ctype_isprint(c.to_int()) != 0
}

///|
extern "c" fn ctype_ispunct(c : Int) -> Int = "ispunct"

///|
pub fn ispunct(c : Byte) -> Bool {
  ctype_ispunct(c.to_int()) != 0
}

///|
extern "c" fn ctype_tolower(c : Int) -> Int = "tolower"

///|
pub fn tolower(c : Byte) -> Byte {
  ctype_tolower(c.to_int()).to_byte()
}

///|
extern "c" fn ctype_toupper(c : Int) -> Int = "toupper"

///|
pub fn toupper(c : Byte) -> Byte {
  ctype_toupper(c.to_int()).to_byte()
}
