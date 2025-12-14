///|
struct Layout {
  mut offset : @stddef.Size
  mut align : @stddef.Size
}

///|
pub fn Layout::new() -> Layout {
  Layout::{ offset: 0, align: 1 }
}

///|
struct ArrayField[_](@stddef.Size, @stddef.Size)

///|
pub fn[T] ArrayField::offset(self : ArrayField[T]) -> @stddef.Size {
  self.0
}

///|
pub fn[T] ArrayField::length(self : ArrayField[T]) -> @stddef.Size {
  self.1
}

///|
pub fn[T : @sizeof.Sized] ArrayField::sizeof(self : ArrayField[T]) -> @stddef.Size {
  self.1 * T::size()
}

///|
struct Field[_](@stddef.Size)

///|
pub impl[T] ToJson for Field[T] with to_json(self : Field[T]) -> Json {
  { "offset": self.0 }
}

///|
pub fn[T] Field::offset(self : Field[T]) -> @stddef.Size {
  self.0
}

///|
/// Adds a field to the struct being built, returning its offset.
pub fn[T : @alignof.Aligned + @sizeof.Sized] Layout::field(self : Layout) -> Field[T] {
  // Save current offset
  let offset = self.offset
  let align = T::alignment()
  // Update struct alignment
  if align > self.align {
    self.align = align
  }
  // Update offset
  self.offset = (self.offset + align - 1) / align * align + T::size()
  // Return field offset
  Field(offset)
}

///|
pub fn[T : @alignof.Aligned + @sizeof.Sized] Layout::array_field(
  self : Layout,
  length : @stddef.Size,
) -> ArrayField[T] {
  // Save current offset
  let offset = self.offset
  let align = T::alignment()
  // Update struct alignment
  if align > self.align {
    self.align = align
  }
  // Update offset
  self.offset = (self.offset + align - 1) / align * align + length * T::size()
  // Return field offset and length
  ArrayField(offset, length)
}

///|
pub fn Layout::size(self : Layout) -> @stddef.Size {
  (self.offset + self.align - 1) / self.align * self.align
}

///|
pub fn Layout::align(self : Layout) -> @stddef.Size {
  self.align
}

///|
pub(all) struct Struct(@pointer.Pointer[Unit])

///|
pub fn Struct::new(pointer : @pointer.Pointer[Unit]) -> Struct {
  Struct(pointer)
}

///|
pub fn[T : Read] Struct::op_get(self : Struct, field : Field[T]) -> T {
  read(self.0.byte_add(field.0).cast())
}

///|
pub fn[T : Write] Struct::op_set(
  self : Struct,
  field : Field[T],
  value : T,
) -> Unit {
  write(self.0.byte_add(field.0).cast(), value)
}

///|
pub fn[T] Struct::get(self : Struct, field : Field[T]) -> @pointer.Pointer[T] {
  self.0.byte_add(field.0).cast()
}
