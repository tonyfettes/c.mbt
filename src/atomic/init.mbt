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
pub(open) trait Init {
  init(ptr : Atomic[Self], value : Self) -> Unit
}

///|
extern "c" fn atomic_init_int(ptr : Atomic[Int], value : Int) = "moonbit_tonyfettes_c_atomic_init_int"

///|
pub impl Init for Int with init(ptr : Atomic[Int], value : Int) -> Unit {
  atomic_init_int(ptr, value)
}

///|
pub fn[T : Init] init_(ptr : Atomic[T], value : T) -> Unit {
  T::init(ptr, value)
}
