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
extern "c" fn ctype_isalnum(c : Int32) -> Int32 = "isalnum"

///|
pub fn isalnum(c : Byte) -> Bool {
  ctype_isalnum(c.to_int()) != 0
}

///|
extern "c" fn ctype_isalpha(c : Int32) -> Int32 = "isalpha"

///|
pub fn isalpha(c : Byte) -> Bool {
  ctype_isalpha(c.to_int()) != 0
}

///|
extern "c" fn ctype_islower(c : Int32) -> Int32 = "islower"

///|
pub fn islower(c : Byte) -> Bool {
  ctype_islower(c.to_int()) != 0
}

///|
extern "c" fn ctype_isupper(c : Int32) -> Int32 = "isupper"

///|
pub fn isupper(c : Byte) -> Bool {
  ctype_isupper(c.to_int()) != 0
}

///|
extern "c" fn ctype_isdigit(c : Int32) -> Int32 = "isdigit"

///|
pub fn isdigit(c : Byte) -> Bool {
  ctype_isdigit(c.to_int()) != 0
}

///|
extern "c" fn ctype_isxdigit(c : Int32) -> Int32 = "isxdigit"

///|
pub fn isxdigit(c : Byte) -> Bool {
  ctype_isxdigit(c.to_int()) != 0
}

///|
extern "c" fn ctype_iscntrl(c : Int32) -> Int32 = "iscntrl"

///|
pub fn iscntrl(c : Byte) -> Bool {
  ctype_iscntrl(c.to_int()) != 0
}

///|
extern "c" fn ctype_isgraph(c : Int32) -> Int32 = "isgraph"

///|
pub fn isgraph(c : Byte) -> Bool {
  ctype_isgraph(c.to_int()) != 0
}

///|
extern "c" fn ctype_isblank(c : Int32) -> Int32 = "isblank"

///|
pub fn isblank(c : Byte) -> Bool {
  ctype_isblank(c.to_int()) != 0
}

///|
extern "c" fn ctype_isspace(c : Int32) -> Int32 = "isspace"

///|
pub fn isspace(c : Byte) -> Bool {
  ctype_isspace(c.to_int()) != 0
}

///|
extern "c" fn ctype_isprint(c : Int32) -> Int32 = "isprint"

///|
pub fn isprint(c : Byte) -> Bool {
  ctype_isprint(c.to_int()) != 0
}

///|
extern "c" fn ctype_ispunct(c : Int32) -> Int32 = "ispunct"

///|
pub fn ispunct(c : Byte) -> Bool {
  ctype_ispunct(c.to_int()) != 0
}

///|
extern "c" fn ctype_tolower(c : Int32) -> Int32 = "tolower"

///|
pub fn tolower(c : Byte) -> Byte {
  ctype_tolower(c.to_int()).to_byte()
}

///|
extern "c" fn ctype_toupper(c : Int32) -> Int32 = "toupper"

///|
pub fn toupper(c : Byte) -> Byte {
  ctype_toupper(c.to_int()).to_byte()
}
