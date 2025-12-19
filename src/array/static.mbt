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
struct Static[T, _](@pointer.Pointer[T])

///|
pub impl[T : @sizeof.Sized, N : @nat.ToUInt64] @sizeof.Sized for Static[T, N] with size() -> @stddef.Size {
  T::size() * @stddef.Size::from_uint64(@nat.to_uint64((_ : N) => ()))
}

///|
pub impl[T : @alignof.Aligned, N] @alignof.Aligned for Static[T, N] with alignment() -> @stddef.Size {
  T::alignment()
}

///|
pub impl[T, N] @pointer.Load for Static[T, N] with load(
  self : @pointer.Pointer[Static[T, N]],
) -> Static[T, N] {
  Static(self.cast())
}

///|
pub fn[T : @pointer.Load + @sizeof.Sized, N] Static::op_get(
  self : Static[T, N],
  index : Int,
) -> T {
  self.0[index]
}

///|
pub fn[T : @pointer.Store + @sizeof.Sized, N] Static::op_set(
  self : Static[T, N],
  index : Int,
  value : T,
) -> Unit {
  self.0[index] = value
}
