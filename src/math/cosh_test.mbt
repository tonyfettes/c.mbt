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
test "cosh" {
  @json.inspect(@math.cosh(0.0), content=1)
  @json.inspect(@math.cosh(1.0), content=1.5430806348152437)
  @json.inspect(@math.coshf(0.0), content=1)
  @json.inspect(@math.coshf(1.0), content=1.5430806875228882)
}
