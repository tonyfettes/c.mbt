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
struct Writer {
  mut pointer : @pointer.Pointer[Unit]
}

///|
pub(open) trait Write {
  write(Writer, Self) -> Unit
}

///|
pub fn Writer::new(pointer : @pointer.Pointer[Unit]) -> Writer {
  Writer::{ pointer, }
}

///|
pub fn Writer::to_pointer(self : Writer) -> @pointer.Pointer[Unit] {
  self.pointer
}

///|
fn[T : Aligned + @sizeof.Sized + @pointer.Store] Writer::write_aligned(
  self : Writer,
  value : T,
) -> Unit {
  // Align pointer to field alignment
  self.pointer = self.pointer.align(T::alignment())
  // Write value to pointer
  self.pointer.cast().store(value)
  // Advance pointer by field size
  self.pointer = self.pointer.byte_add(T::size())
}

///|
pub impl Write for Bool with write(self : Writer, value : Bool) -> Unit {
  self.write_aligned(value)
}

///|
pub impl Write for Byte with write(self : Writer, value : Byte) -> Unit {
  self.write_aligned(value)
}

///|
pub impl Write for Int16 with write(self : Writer, value : Int16) -> Unit {
  self.write_aligned(value)
}

///|
pub impl Write for UInt16 with write(self : Writer, value : UInt16) -> Unit {
  self.write_aligned(value)
}

///|
pub impl Write for Int with write(self : Writer, value : Int) -> Unit {
  self.write_aligned(value)
}

///|
pub impl Write for UInt with write(self : Writer, value : UInt) -> Unit {
  self.write_aligned(value)
}

///|
pub impl Write for Int64 with write(self : Writer, value : Int64) -> Unit {
  self.write_aligned(value)
}

///|
pub impl Write for UInt64 with write(self : Writer, value : UInt64) -> Unit {
  self.write_aligned(value)
}

///|
pub impl Write for Float with write(self : Writer, value : Float) -> Unit {
  self.write_aligned(value)
}

///|
pub impl Write for Double with write(self : Writer, value : Double) -> Unit {
  self.write_aligned(value)
}

///|
pub impl[T] Write for @pointer.Pointer[T] with write(
  self : Writer,
  value : @pointer.Pointer[T],
) -> Unit {
  self.write_aligned(value)
}

///|
pub fn[T : Write] Writer::write(self : Writer, value : T) -> Unit {
  T::write(self, value)
}

///|
pub fn[T : Write] write(pointer : @pointer.Pointer[T], value : T) -> Unit {
  Writer::new(pointer.cast()).write(value)
}
