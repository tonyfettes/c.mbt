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
struct Dynamic[T](@pointer.Pointer[T])

///|
pub impl[T] @pointer.Load for Dynamic[T] with load(
  self : @pointer.Pointer[Dynamic[T]],
) -> Dynamic[T] {
  Dynamic(self.cast())
}

///|
pub fn[T : @pointer.Load + @sizeof.Sized] Dynamic::op_get(
  self : Dynamic[T],
  index : Int,
) -> T {
  self.0[index]
}

///|
pub fn[T : @pointer.Store + @sizeof.Sized] Dynamic::op_set(
  self : Dynamic[T],
  index : Int,
  value : T,
) -> Unit {
  self.0[index] = value
}

///|
pub fn[T] Dynamic::pointer(self : Dynamic[T]) -> @pointer.Pointer[T] {
  self.0
}
