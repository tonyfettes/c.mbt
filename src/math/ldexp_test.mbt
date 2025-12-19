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
test "ldexp" {
  @json.inspect(@math.ldexp(0.5, 3), content=4) // 0.5 * 2^3 = 4
  @json.inspect(@math.ldexp(1.0, 0), content=1) // 1.0 * 2^0 = 1
  @json.inspect(@math.ldexp(2.0, 2), content=8) // 2.0 * 2^2 = 8
  @json.inspect(@math.ldexpf(0.5, 3), content=4)
}
