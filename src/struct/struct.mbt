///|
struct Builder {
  mut offset : @stddef.Size
  mut align : @stddef.Size
}

///|
pub fn Builder::new() -> Builder {
  Builder::{ offset: 0, align: 1 }
}

///|
struct Field[_, _] {
  offset : @stddef.Size
  size : @stddef.Size
  alignment : @stddef.Size
}

///|
pub fn[S, T : @alignof.Aligned + @sizeof.Sized] field() -> Field[S, T] {
  Field::{ offset: 0, size: T::size(), alignment: T::alignment() }
}

///|
pub impl[S, T] ToJson for Field[S, T] with to_json(self : Field[S, T]) -> Json {
  { "offset": self.offset, "size": self.size, "alignment": self.alignment }
}

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
struct Flatten[T](@pointer.Pointer[T])

///|
pub impl[T] @pointer.Load for Flatten[T] with load(
  self : @pointer.Pointer[Flatten[T]],
) -> Flatten[T] {
  Flatten(self.cast())
}

///|
pub fn[T : @pointer.Load + @sizeof.Sized] Flatten::op_get(
  self : Flatten[T],
  index : Int,
) -> T {
  self.0[index]
}

///|
pub fn[T : @pointer.Store + @sizeof.Sized] Flatten::op_set(
  self : Flatten[T],
  index : Int,
  value : T,
) -> Unit {
  self.0[index] = value
}

///|
pub type ArrayField[S, T] = Field[S, Flatten[T]]

///|
/// Adds a field to the struct being built, returning its offset.
pub fn[S, T : @alignof.Aligned + @sizeof.Sized] Builder::field(
  self : Builder,
) -> Field[S, T] {
  // Update struct alignment
  let alignment = T::alignment()
  if alignment > self.align {
    self.align = alignment
  }
  // Align up offset
  self.offset = (self.offset + alignment - 1) / alignment * alignment
  // Save current offset
  let offset = self.offset
  // Update offset
  self.offset = self.offset + T::size()
  // Return field offset
  Field::{ offset, size: T::size(), alignment }
}

///|
pub fn[S, T : @alignof.Aligned + @sizeof.Sized] Builder::array_field(
  self : Builder,
  length : @stddef.Size,
) -> Field[S, Flatten[T]] {
  // Update struct alignment
  let alignment = T::alignment()
  if alignment > self.align {
    self.align = alignment
  }
  // Align up offset
  self.offset = (self.offset + alignment - 1) / alignment * alignment
  // Save current offset
  let offset = self.offset
  // Update offset
  self.offset = self.offset + T::size() * length
  // Return field offset and length
  Field::{ offset, size: T::size() * length, alignment }
}

///|
pub fn[S, T : @alignof.Aligned + @sizeof.Sized] Builder::struct_field(
  self : Builder,
) -> Field[S, Struct[T]] {
  let size = T::size()
  let alignment = T::alignment()
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
  Field::{ offset, size, alignment }
}

///|
pub fn[S, C, N : @alignof.Aligned + @sizeof.Sized] Field::next(
  self : Field[S, C],
) -> Field[S, N] {
  let alignment = if N::alignment() > self.alignment {
    N::alignment()
  } else {
    self.alignment
  }
  let offset = (self.offset + self.size + alignment - 1) / alignment * alignment
  Field::{ offset, size: N::size(), alignment }
}

///|
pub fn[S, C, N : @alignof.Aligned + @sizeof.Sized] Field::next_array(
  self : Field[S, C],
  length : @stddef.Size,
) -> Field[S, Flatten[N]] {
  let alignment = if N::alignment() > self.alignment {
    N::alignment()
  } else {
    self.alignment
  }
  let offset = (self.offset + self.size + alignment - 1) / alignment * alignment
  Field::{ offset, size: N::size() * length, alignment }
}

///|
pub fn[S, C, N : @alignof.Aligned + @sizeof.Sized] Field::next_struct(
  self : Field[S, C],
) -> Field[S, Struct[N]] {
  let alignment = if N::alignment() > self.alignment {
    N::alignment()
  } else {
    self.alignment
  }
  let offset = (self.offset + self.size + alignment - 1) / alignment * alignment
  Field::{ offset, size: N::size(), alignment }
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
pub(all) struct Struct[S](@pointer.Pointer[Struct[S]])

///|
pub fn[S] Struct::pointer(self : Struct[S]) -> @pointer.Pointer[Struct[S]] {
  self.0
}

///|
pub fn[S] Struct::new(pointer : @pointer.Pointer[Struct[S]]) -> Struct[S] {
  Struct(pointer)
}

///|
pub fn[S, T : @pointer.Load] Struct::op_get(
  self : Struct[S],
  field : Field[S, T],
) -> T {
  self.0.byte_add(field.offset).cast().load()
}

///|
pub fn[S, T : @pointer.Store] Struct::op_set(
  self : Struct[S],
  field : Field[S, T],
  value : T,
) -> Unit {
  self.0.byte_add(field.offset).cast().store(value)
}

///|
pub fn[S, T] Struct::get(
  self : Struct[S],
  field : Field[S, T],
) -> @pointer.Pointer[T] {
  self.0.byte_add(field.offset).cast()
}

///|
pub impl[S] @pointer.Load for Struct[S] with load(
  pointer : @pointer.Pointer[Struct[S]],
) -> Struct[S] {
  Struct(pointer)
}
