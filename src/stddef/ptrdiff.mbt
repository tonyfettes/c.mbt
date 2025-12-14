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
pub(all) struct Ptrdiff(Int64)

///|
pub impl Show for Ptrdiff with output(self : Ptrdiff, logger : &Logger) -> Unit {
  self.0.output(logger)
}

///|
pub impl ToJson for Ptrdiff with to_json(self : Ptrdiff) -> Json {
  Json::number(self.0.to_double(), repr=self.0.to_string())
}

///|
pub impl @json.FromJson for Ptrdiff with from_json(
  json : Json,
  json_path : @json.JsonPath,
) -> Ptrdiff {
  match json {
    Number(num, repr=None) => Ptrdiff(num.to_int64())
    Number(_, repr=Some(repr)) =>
      @strconv.parse_int64(repr) catch {
        error =>
          raise @json.JsonDecodeError(
            (json_path, "Invalid Ptrdiff \{repr}: \{error}"),
          )
      }
    _ =>
      raise @json.JsonDecodeError(
        (json_path, "Expected Ptrdiff as number, got \{json}"),
      )
  }
}

///|
pub fn Ptrdiff::to_int64(self : Ptrdiff) -> Int64 {
  self.0
}

///|
pub fn Ptrdiff::reinterpret_as_uint64(self : Ptrdiff) -> UInt64 {
  self.0.reinterpret_as_uint64()
}

///|
pub impl Add for Ptrdiff with add(self : Ptrdiff, other : Ptrdiff) -> Ptrdiff {
  Ptrdiff(self.0 + other.0)
}

///|
pub impl Sub for Ptrdiff with sub(self : Ptrdiff, other : Ptrdiff) -> Ptrdiff {
  Ptrdiff(self.0 - other.0)
}

///|
pub impl Mul for Ptrdiff with mul(self : Ptrdiff, other : Ptrdiff) -> Ptrdiff {
  Ptrdiff(self.0 * other.0)
}

///|
pub impl Div for Ptrdiff with div(self : Ptrdiff, other : Ptrdiff) -> Ptrdiff {
  Ptrdiff(self.0 / other.0)
}

///|
pub impl Mod for Ptrdiff with mod(self : Ptrdiff, other : Ptrdiff) -> Ptrdiff {
  Ptrdiff(self.0 % other.0)
}

///|
pub impl Eq for Ptrdiff with equal(self : Ptrdiff, other : Ptrdiff) -> Bool {
  self.0 == other.0
}

///|
pub impl Compare for Ptrdiff with compare(self : Ptrdiff, other : Ptrdiff) -> Int {
  self.0.compare(other.0)
}

///|
pub impl Neg for Ptrdiff with neg(self : Ptrdiff) -> Ptrdiff {
  Ptrdiff(-self.0)
}

///|
pub impl Default for Ptrdiff with default() -> Ptrdiff {
  Ptrdiff(0L)
}
