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
test "tanh" {
  @json.inspect(@math.tanh(0.0), content=0)
  @json.inspect(@math.tanh(1.0), content=0.7615941559557649)
  @json.inspect(@math.tanhf(0.0), content=0)
  @json.inspect(@math.tanhf(1.0), content=0.7615941762924194)
}
