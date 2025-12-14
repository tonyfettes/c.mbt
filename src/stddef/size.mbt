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
pub(all) struct Size(UInt64)

///|
pub impl Show for Size with output(self : Size, logger : &Logger) -> Unit {
  self.0.output(logger)
}

///|
pub impl ToJson for Size with to_json(self : Size) -> Json {
  Json::number(self.0.to_double(), repr=self.0.to_string())
}

///|
pub impl @json.FromJson for Size with from_json(
  json : Json,
  json_path : @json.JsonPath,
) -> Size {
  match json {
    Number(num, repr=None) => Size(num.to_uint64())
    Number(_, repr=Some(repr)) =>
      @strconv.parse_uint64(repr) catch {
        error =>
          raise @json.JsonDecodeError(
            (json_path, "Invalid Size \{repr}: \{error}"),
          )
      }
    _ =>
      raise @json.JsonDecodeError(
        (json_path, "Expected Size as number, got \{json}"),
      )
  }
}

///|
pub fn Size::to_int(self : Size) -> Int {
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
pub impl Add for Size with add(self : Size, other : Size) -> Size {
  Size(self.0 + other.0)
}

///|
pub impl Sub for Size with sub(self : Size, other : Size) -> Size {
  Size(self.0 - other.0)
}

///|
pub impl Mul for Size with mul(self : Size, other : Size) -> Size {
  Size(self.0 * other.0)
}

///|
pub impl Div for Size with div(self : Size, other : Size) -> Size {
  Size(self.0 / other.0)
}

///|
pub impl Mod for Size with mod(self : Size, other : Size) -> Size {
  Size(self.0 % other.0)
}

///|
pub impl Eq for Size with equal(self : Size, other : Size) -> Bool {
  self.0 == other.0
}

///|
pub impl Compare for Size with compare(self : Size, other : Size) -> Int {
  self.0.compare(other.0)
}

///|
pub impl Default for Size with default() -> Size {
  Size(0UL)
}

///|
extern "c" fn sizeof_size_t() -> UInt64 = "moonbit_tonyfettes_c_stddef_sizeof_size_t"

///|
pub fn Size::sizeof() -> Size {
  Size(sizeof_size_t())
}
