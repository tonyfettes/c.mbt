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
test "Size::sizeof" {
  @stddef.Size::sizeof() |> ignore()
}

///|
test "Size::to_int" {
  let size = @stddef.Size(42UL)
  @json.inspect(size.to_int(), content=42)
}

///|
test "Size::to_uint64" {
  let size = @stddef.Size(42UL)
  @json.inspect(size.to_uint64(), content="42")
}

///|
test "Size::reinterpret_as_int64" {
  let size = @stddef.Size(42UL)
  @json.inspect(size.reinterpret_as_int64(), content="42")
}

///|
test "Size::to_json" {
  let original = @stddef.Size(@uint64.max_value)
  let json = original.to_json()
  inspect(json.stringify(indent=2), content="18446744073709551615")
  let parsed : @stddef.Size = @json.from_json(json)
  assert_eq(parsed, original)
}

///|
test "Size::from_json" {
  let size : @stddef.Size = @json.from_json(42)
  @json.inspect(size.to_uint64(), content="42")
}
