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
struct Reader {
  mut pointer : @pointer.Pointer[Unit]
}

///|
pub fn Reader::new(pointer : @pointer.Pointer[Unit]) -> Reader {
  Reader::{ pointer, }
}

///|
pub fn Reader::to_pointer(self : Reader) -> @pointer.Pointer[Unit] {
  self.pointer
}

///|
pub(open) trait Read {
  read(Reader) -> Self
}

///|
pub fn[T : Read] Reader::read(self : Reader) -> T {
  T::read(self)
}

///|
fn Reader::align(self : Reader, alignment : @stddef.Size) -> Unit {
  self.pointer = self.pointer.align(alignment)
}

///|
fn[T : @alignof.Aligned + @sizeof.Sized + @pointer.Load] Reader::read_aligned(
  self : Reader,
) -> T {
  // Align pointer to field alignment
  self.align(T::alignment())
  // Read value from pointer
  let value : T = self.pointer.cast().load()
  // Advance pointer
  self.pointer = self.pointer.byte_add(T::size())
  // Return value
  value
}

///|
pub impl Read for Bool with read(self : Reader) -> Bool {
  self.read_aligned()
}

///|
pub impl Read for Byte with read(self : Reader) -> Byte {
  self.read_aligned()
}

///|
pub impl Read for Int16 with read(self : Reader) -> Int16 {
  self.read_aligned()
}

///|
pub impl Read for UInt16 with read(self : Reader) -> UInt16 {
  self.read_aligned()
}

///|
pub impl Read for Int with read(self : Reader) -> Int {
  self.read_aligned()
}

///|
pub impl Read for UInt with read(self : Reader) -> UInt {
  self.read_aligned()
}

///|
pub impl Read for Int64 with read(self : Reader) -> Int64 {
  self.read_aligned()
}

///|
pub impl Read for UInt64 with read(self : Reader) -> UInt64 {
  self.read_aligned()
}

///|
pub impl Read for Float with read(self : Reader) -> Float {
  self.read_aligned()
}

///|
pub impl Read for Double with read(self : Reader) -> Double {
  self.read_aligned()
}

///|
pub impl[T] Read for @pointer.Pointer[T] with read(self : Reader) -> @pointer.Pointer[
  T,
] {
  self.read_aligned()
}

///|
pub fn[T : Read] read(pointer : @pointer.Pointer[T]) -> T {
  Reader::new(pointer.cast()).read()
}
