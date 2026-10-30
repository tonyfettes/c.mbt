// Copyright 2026 International Digital Economy Academy
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
struct Builder {
  mut offset : @stddef.Size
  mut align : @stddef.Size
}

///|
pub fn Builder::new() -> Builder {
  { offset: 0, align: 1, }
}

///|
struct Field[_, _] {
  offset : @stddef.Size
  size : @stddef.Size
  alignment : @stddef.Size
}

///|
/// Resolves the size of `T`. The callback only pins `T`: a type parameter with
/// several trait bounds cannot call `T::size()` directly.
fn[T : @sizeof.Sized] size_of(_ : FuncRef[(T) -> Unit]) -> @stddef.Size {
  T::size()
}

///|
/// Resolves the alignment of `T`. See `size_of` for the callback argument.
fn[T : @alignof.Aligned] alignment_of(_ : FuncRef[(T) -> Unit]) -> @stddef.Size {
  T::alignment()
}

///|
pub fn[S, T : @alignof.Aligned + @sizeof.Sized] field() -> Field[S, T] {
  {
    offset: 0,
    size: size_of((_ : T) => ()),
    alignment: alignment_of((_ : T) => ()),
  }
}

///|
pub impl[S, T] ToJson for Field[S, T] with fn to_json(self : Field[S, T]) -> Json {
  { "offset": self.offset, "size": self.size, "alignment": self.alignment }
}

///|
pub extend Field with ToJson::{to_json}

///|
pub fn[S, T] Field::offset(self : Field[S, T]) -> @stddef.Size {
  self.offset
}

///|
pub fn[S, T] Field::alignment(self : Field[S, T]) -> @stddef.Size {
  self.alignment
}

///|
pub fn[S, T] Field::next_offset(self : Field[S, T]) -> @stddef.Size {
  (self.offset + self.size + self.alignment - 1) /
  self.alignment *
  self.alignment
}

///|
/// Adds a field to the struct being built, returning its offset.
pub fn[S, T : @alignof.Aligned + @sizeof.Sized] Builder::field(
  self : Builder,
) -> Field[S, T] {
  let size = size_of((_ : T) => ())
  // Update struct alignment
  let alignment = alignment_of((_ : T) => ())
  if alignment > self.align {
    self.align = alignment
  }
  // Align up offset
  self.offset = (self.offset + alignment - 1) / alignment * alignment
  // Save current offset
  let offset = self.offset
  // Update offset
  self.offset = self.offset + size
  // Return field offset
  { offset, size, alignment, }
}

///|
pub fn[S, T : @alignof.Aligned + @sizeof.Sized] Builder::array_field(
  self : Builder,
  length : @stddef.Size,
) -> Field[S, @array.Dynamic[T]] {
  let size = size_of((_ : T) => ()) * length
  // Update struct alignment
  let alignment = alignment_of((_ : T) => ())
  if alignment > self.align {
    self.align = alignment
  }
  // Align up offset
  self.offset = (self.offset + alignment - 1) / alignment * alignment
  // Save current offset
  let offset = self.offset
  // Update offset
  self.offset = self.offset + size
  // Return field offset and length
  { offset, size, alignment, }
}

///|
pub fn[S, T : @alignof.Aligned + @sizeof.Sized] Builder::struct_field(
  self : Builder,
) -> Field[S, Struct[T]] {
  let size = size_of((_ : T) => ())
  let alignment = alignment_of((_ : T) => ())
  // Update struct alignment
  if alignment > self.align {
    self.align = alignment
  }
  // Align up offset
  self.offset = (self.offset + alignment - 1) / alignment * alignment
  // Save current offset
  let offset = self.offset
  // Update offset
  self.offset = self.offset + size
  // Return field offset
  { offset, size, alignment, }
}

///|
pub fn[S, C, N : @alignof.Aligned + @sizeof.Sized] Field::next(
  self : Field[S, C],
) -> Field[S, N] {
  let alignment = if alignment_of((_ : N) => ()) > self.alignment {
    alignment_of((_ : N) => ())
  } else {
    self.alignment
  }
  let offset = (self.offset + self.size + alignment - 1) / alignment * alignment
  { offset, size: size_of((_ : N) => ()), alignment, }
}

///|
pub fn[S, C, N : @alignof.Aligned + @sizeof.Sized] Field::next_array(
  self : Field[S, C],
  length : @stddef.Size,
) -> Field[S, @array.Dynamic[N]] {
  let alignment = if alignment_of((_ : N) => ()) > self.alignment {
    alignment_of((_ : N) => ())
  } else {
    self.alignment
  }
  let offset = (self.offset + self.size + alignment - 1) / alignment * alignment
  { offset, size: size_of((_ : N) => ()) * length, alignment, }
}

///|
pub fn[S, C, N : @alignof.Aligned + @sizeof.Sized] Field::next_struct(
  self : Field[S, C],
) -> Field[S, Struct[N]] {
  let alignment = if alignment_of((_ : N) => ()) > self.alignment {
    alignment_of((_ : N) => ())
  } else {
    self.alignment
  }
  let offset = (self.offset + self.size + alignment - 1) / alignment * alignment
  { offset, size: size_of((_ : N) => ()), alignment, }
}

///|
pub fn Builder::size(self : Builder) -> @stddef.Size {
  (self.offset + self.align - 1) / self.align * self.align
}

///|
pub fn Builder::alignment(self : Builder) -> @stddef.Size {
  self.align
}

///|
#external
pub(all) type Struct[S]

///|
pub fn[S] Struct::pointer(self : Struct[S]) -> @pointer.Pointer[Struct[S]] = "%identity"

///|
pub fn[S] Struct::new(pointer : @pointer.Pointer[Struct[S]]) -> Struct[S] = "%identity"

///|
#alias("_[_]")
pub fn[S, T : @pointer.Load] Struct::at(
  self : Struct[S],
  field : Field[S, T],
) -> T {
  self.pointer().byte_add(field.offset).cast().load()
}

///|
#alias("_[_]=_")
pub fn[S, T : @pointer.Store] Struct::set(
  self : Struct[S],
  field : Field[S, T],
  value : T,
) -> Unit {
  self.pointer().byte_add(field.offset).cast().store(value)
}

///|
pub fn[S, T] Struct::get(
  self : Struct[S],
  field : Field[S, T],
) -> @pointer.Pointer[T] {
  self.pointer().byte_add(field.offset).cast()
}

///|
pub impl[S] @pointer.Load for Struct[S] with fn load(
  pointer : @pointer.Pointer[Struct[S]],
) -> Struct[S] {
  Struct::new(pointer)
}

///|
pub extend Struct with @pointer.Load::{load}
