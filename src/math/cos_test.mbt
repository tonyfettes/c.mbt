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
test "cos" {
  json_inspect(@math.cos(0.0), content=1)
  json_inspect(@math.cos(1.5707963267948966), content=6.123233995736766e-17) // pi/2, approximately 0
  json_inspect(@math.cosf(0.0), content=1)
}
