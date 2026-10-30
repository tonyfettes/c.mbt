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
pub(all) struct Ptrdiff(Int64)

///|
pub impl Show for Ptrdiff with fn output(self : Ptrdiff, logger : &Logger) -> Unit {
  Show::output(self.0, logger)
}

///|
pub extend Ptrdiff with Show::{to_string, output}

///|
pub impl ToJson for Ptrdiff with fn to_json(self : Ptrdiff) -> Json {
  Json::number(self.0.to_double(), repr=self.0.to_string())
}

///|
pub extend Ptrdiff with ToJson::{to_json}

///|
pub impl @json.FromJson for Ptrdiff with fn from_json(
  json : Json,
  json_path : @json.JsonPath,
) -> Ptrdiff {
  match json {
    Number(num, repr=None) => Ptrdiff(num.to_int64())
    Number(_, repr=Some(repr)) =>
      @string.parse_int64(repr) catch {
        error =>
          raise JsonDecodeError(
            (json_path, "Invalid Ptrdiff \{repr}: \{error}"),
          )
      }
    _ =>
      raise JsonDecodeError(
        (json_path, "Expected Ptrdiff as number, got \{Repr(json)}"),
      )
  }
}

///|
pub extend Ptrdiff with @json.FromJson::{from_json}

///|
pub fn Ptrdiff::to_int64(self : Ptrdiff) -> Int64 {
  self.0
}

///|
pub fn Ptrdiff::reinterpret_as_uint64(self : Ptrdiff) -> UInt64 {
  self.0.reinterpret_as_uint64()
}

///|
pub impl Add for Ptrdiff with fn add(self : Ptrdiff, other : Ptrdiff) -> Ptrdiff {
  Ptrdiff(self.0 + other.0)
}

///|
pub extend Ptrdiff with Add::{add}

///|
pub impl Sub for Ptrdiff with fn sub(self : Ptrdiff, other : Ptrdiff) -> Ptrdiff {
  Ptrdiff(self.0 - other.0)
}

///|
pub extend Ptrdiff with Sub::{sub}

///|
pub impl Mul for Ptrdiff with fn mul(self : Ptrdiff, other : Ptrdiff) -> Ptrdiff {
  Ptrdiff(self.0 * other.0)
}

///|
pub extend Ptrdiff with Mul::{mul}

///|
pub impl Div for Ptrdiff with fn div(self : Ptrdiff, other : Ptrdiff) -> Ptrdiff {
  Ptrdiff(self.0 / other.0)
}

///|
pub extend Ptrdiff with Div::{div}

///|
pub impl Mod for Ptrdiff with fn mod(self : Ptrdiff, other : Ptrdiff) -> Ptrdiff {
  Ptrdiff(self.0 % other.0)
}

///|
pub extend Ptrdiff with Mod::{mod}

///|
pub impl Eq for Ptrdiff with fn equal(self : Ptrdiff, other : Ptrdiff) -> Bool {
  self.0 == other.0
}

///|
pub extend Ptrdiff with Eq::{not_equal, equal}

///|
pub impl Compare for Ptrdiff with fn compare(self : Ptrdiff, other : Ptrdiff) -> Int32 {
  self.0.compare(other.0)
}

///|
pub extend Ptrdiff with Compare::{op_lt, op_le, op_ge, compare, op_gt}

///|
pub impl Neg for Ptrdiff with fn neg(self : Ptrdiff) -> Ptrdiff {
  Ptrdiff(-self.0)
}

///|
pub extend Ptrdiff with Neg::{neg}

///|
pub impl Default for Ptrdiff with fn default() -> Ptrdiff {
  Ptrdiff(0L)
}

///|
pub extend Ptrdiff with Default::{default}

///|
extern "c" fn sizeof_ptrdiff_t() -> UInt64 = "moonbit_tonyfettes_c_stddef_sizeof_ptrdiff_t"

///|
pub fn Ptrdiff::sizeof() -> Size {
  Size(sizeof_ptrdiff_t())
}
