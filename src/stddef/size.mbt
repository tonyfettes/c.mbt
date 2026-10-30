// Copyright 2026 International Digital Economy Academy
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
pub(all) struct Size(UInt64)

///|
pub impl Show for Size with fn output(self : Size, logger : &Logger) -> Unit {
  Show::output(self.0, logger)
}

///|
pub extend Size with Show::{to_string, output}

///|
pub impl ToJson for Size with fn to_json(self : Size) -> Json {
  Json::number(self.0.to_double(), repr=self.0.to_string())
}

///|
pub extend Size with ToJson::{to_json}

///|
pub impl @json.FromJson for Size with fn from_json(
  json : Json,
  json_path : @json.JsonPath,
) -> Size {
  match json {
    Number(num, repr=None) => Size(num.to_uint64())
    Number(_, repr=Some(repr)) =>
      @string.parse_uint64(repr) catch {
        error =>
          raise JsonDecodeError((json_path, "Invalid Size \{repr}: \{error}"))
      }
    _ =>
      raise JsonDecodeError(
        (json_path, "Expected Size as number, got \{Repr(json)}"),
      )
  }
}

///|
pub extend Size with @json.FromJson::{from_json}

///|
pub fn Size::from_uint64(value : UInt64) -> Size {
  Size(value)
}

///|
pub fn Size::to_int(self : Size) -> Int32 {
  self.0.to_int()
}

///|
#inline
pub fn Size::to_uint64(self : Size) -> UInt64 {
  self.0
}

///|
pub fn Size::reinterpret_as_int64(self : Size) -> Int64 {
  self.0.reinterpret_as_int64()
}

///|
pub impl Add for Size with fn add(self : Size, other : Size) -> Size {
  Size(self.0 + other.0)
}

///|
pub extend Size with Add::{add}

///|
pub impl Sub for Size with fn sub(self : Size, other : Size) -> Size {
  Size(self.0 - other.0)
}

///|
pub extend Size with Sub::{sub}

///|
pub impl Mul for Size with fn mul(self : Size, other : Size) -> Size {
  Size(self.0 * other.0)
}

///|
pub extend Size with Mul::{mul}

///|
pub impl Div for Size with fn div(self : Size, other : Size) -> Size {
  Size(self.0 / other.0)
}

///|
pub extend Size with Div::{div}

///|
pub impl Mod for Size with fn mod(self : Size, other : Size) -> Size {
  Size(self.0 % other.0)
}

///|
pub extend Size with Mod::{mod}

///|
pub impl Eq for Size with fn equal(self : Size, other : Size) -> Bool {
  self.0 == other.0
}

///|
pub extend Size with Eq::{not_equal, equal}

///|
pub impl Compare for Size with fn compare(self : Size, other : Size) -> Int32 {
  self.0.compare(other.0)
}

///|
pub extend Size with Compare::{op_lt, op_le, op_ge, compare, op_gt}

///|
pub impl Default for Size with fn default() -> Size {
  Size(0UL)
}

///|
pub extend Size with Default::{default}

///|
extern "c" fn sizeof_size_t() -> UInt64 = "moonbit_tonyfettes_c_stddef_sizeof_size_t"

///|
pub fn Size::sizeof() -> Size {
  Size(sizeof_size_t())
}
