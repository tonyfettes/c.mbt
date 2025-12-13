///|
struct Layout {
  mut offset : UInt64
  mut align : UInt64
}

///|
pub fn Layout::new() -> Layout {
  Layout::{ offset: 0, align: 1 }
}

///|
struct Field(UInt64)

///|
pub impl ToJson for Field with to_json(self : Field) -> Json {
  { "offset": self.0 }
}

///|
pub fn Field::offset(self : Field) -> UInt64 {
  self.0
}

///|
/// Adds a field to the struct being built, returning its offset.
pub fn Layout::field(self : Layout, field : Type) -> Field {
  // Save current offset
  let offset = self.offset
  let field_align = field.align
  // Update struct alignment
  if field_align > self.align {
    self.align = field_align
  }
  // Update offset
  self.offset = (self.offset + field_align - 1) / field_align * field_align +
    field.size
  // Return field offset
  Field(offset)
}

///|
pub fn Layout::finish(self : Layout) -> Type {
  let size = (self.offset + self.align - 1) / self.align * self.align
  Type::{ size, align: self.align }
}

///|
struct Reader {
  mut pointer : @pointer.Pointer[Byte]
}

///|
pub fn Reader::new(pointer : @pointer.Pointer[Byte]) -> Reader {
  Reader::{ pointer, }
}

///|
fn align_above(
  pointer : @pointer.Pointer[Byte],
  alignment : UInt64,
) -> @pointer.Pointer[Byte] {
  let address : UInt64 = pointer.to_uint64()
  let remainder = address % alignment
  if remainder == 0 {
    return pointer
  }
  pointer.offset(
    alignment.reinterpret_as_int64() - remainder.reinterpret_as_int64(),
  )
}

///|
pub fn[T : @alignof.Aligned + @sizeof.Sized] Reader::read(self : Reader) -> T {
  // Align pointer to field alignment
  self.pointer = align_above(self.pointer, T::alignment())
  // Read value from pointer
  let value : T = self.pointer.cast().load()
  // Advance pointer by field size
  self.pointer = self.pointer.offset(T::size().reinterpret_as_int64())
  // Return value
  value
}

///|
pub fn Reader::read_int(self : Reader) -> Int {
  self.read()
}

///|
pub fn Reader::read_byte(self : Reader) -> Byte {
  self.read()
}

///|
struct Writer {
  mut pointer : @pointer.Pointer[Byte]
}

///|
pub fn Writer::new(pointer : @pointer.Pointer[Byte]) -> Writer {
  Writer::{ pointer, }
}

///|
pub fn[T : @alignof.Aligned + @sizeof.Sized] Writer::write(
  self : Writer,
  value : T,
) -> Unit {
  // Align pointer to field alignment
  self.pointer = align_above(self.pointer, T::alignment())
  // Write value to pointer
  self.pointer.cast().store(value)
  // Advance pointer by field size
  self.pointer = self.pointer.offset(T::size().reinterpret_as_int64())
}
