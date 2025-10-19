///|
#external
pub type Pointer[_]

///|
pub typealias Pointer as Ptr

///|
pub fn[T, U] Pointer::cast(self : Pointer[T]) -> Pointer[U] = "%identity"

///|
extern "c" fn pointer_null() -> Pointer[Unit] = "moonbit_tonyfettes_c_pointer_null"

///|
pub fn[T] Pointer::null() -> Pointer[T] {
  pointer_null().cast()
}

///|
extern "c" fn pointer_is_null(ptr : Pointer[Unit]) -> Bool = "moonbit_tonyfettes_c_pointer_is_null"

///|
pub fn[T] Pointer::is_null(self : Pointer[T]) -> Bool {
  pointer_is_null(self.cast())
}

///|
extern "c" fn pointer_is_not_null(ptr : Pointer[Unit]) -> Bool = "moonbit_tonyfettes_c_pointer_is_not_null"

///|
pub fn[T] Pointer::is_not_null(self : Pointer[T]) -> Bool {
  pointer_is_not_null(self.cast())
}

///|
extern "c" fn pointer_equal(
  self : Pointer[Unit],
  other : Pointer[Unit],
) -> Bool = "moonbit_tonyfettes_c_pointer_equal"

///|
pub impl[T] Eq for Pointer[T] with equal(self : Pointer[T], other : Pointer[T]) -> Bool {
  self.cast().pointer_equal(other.cast())
}

///|
extern "c" fn pointer_compare(
  lower : Pointer[Byte],
  upper : Pointer[Byte],
) -> Int = "moonbit_tonyfettes_c_pointer_compare"

///|
pub impl[T] Compare for Pointer[T] with compare(
  self : Pointer[T],
  other : Pointer[T],
) -> Int {
  pointer_compare(self.cast(), other.cast())
}

///|
extern "c" fn sizeof_pointer() -> UInt64 = "moonbit_tonyfettes_c_sizeof_pointer"

///|
pub impl[T] Sizeof for Pointer[T] with sizeof() -> UInt64 {
  sizeof_pointer()
}

///|
extern "c" fn pointer_add(
  pointer : Pointer[Byte],
  offset : UInt64,
) -> Pointer[Byte] = "moonbit_tonyfettes_c_pointer_add"

///|
/// Adds an offset to a pointer and returns a new pointer.
///
/// Parameters:
///
/// - `pointer`: The original pointer.
/// - `offset`: The offset to add, in number of elements of type `T`.
///
/// Returns a new pointer that is offset from the original pointer by the
/// specified number of elements.
///
/// **Note**: The offset is subject to overflow.
pub fn[T : Sizeof] Pointer::add(
  self : Pointer[T],
  offset : UInt64,
) -> Pointer[T] {
  pointer_add(self.cast(), offset * T::sizeof()).cast()
}

///|
extern "c" fn pointer_sub(
  pointer : Pointer[Byte],
  offset : UInt64,
) -> Pointer[Byte] = "moonbit_tonyfettes_c_pointer_sub"

///|
/// Subtracts an offset from a pointer and returns a new pointer.
///
/// Parameters:
///
/// - `pointer`: The original pointer.
/// - `offset`: The offset to subtract, in number of elements of type `T`.
///
/// Returns a new pointer that is offset from the original pointer by the
/// specified number of elements.
///
/// **Note**: The offset is subject to overflow.
pub fn[T : Sizeof] Pointer::sub(
  self : Pointer[T],
  offset : UInt64,
) -> Pointer[T] {
  pointer_sub(self.cast(), offset * T::sizeof()).cast()
}

///|
extern "c" fn pointer_offset(
  pointer : Pointer[Byte],
  offset : Int64,
) -> Pointer[Byte] = "moonbit_tonyfettes_c_pointer_offset"

///|
/// Adds an offset to a pointer and returns a new pointer.
///
/// Parameters:
///
/// - `pointer`: The original pointer.
/// - `offset`: The offset to add, in number of elements of type `T`.
///
/// Returns a new pointer that is offset from the original pointer by the
/// specified number of elements.
///
/// **Note**: The offset is of type `Int64` and might be insufficient for very large
/// offsets on some platforms.
pub fn[T : Sizeof] Pointer::offset(
  self : Pointer[T],
  offset : Int64,
) -> Pointer[T] {
  pointer_offset(self.cast(), offset * T::sizeof().reinterpret_as_int64()).cast()
}

///|
extern "c" fn pointer_offset_from(
  upper : Pointer[Byte],
  lower : Pointer[Byte],
) -> Int64 = "moonbit_tonyfettes_c_pointer_offset_from"

///|
pub fn[T : Sizeof] Pointer::offset_from(
  self : Pointer[T],
  other : Pointer[T],
) -> Int64 {
  pointer_offset_from(self.cast(), other.cast()) /
  T::sizeof().reinterpret_as_int64()
}

///|
pub fn[T : Load + Sizeof] Pointer::op_get(
  self : Pointer[T],
  index : UInt64,
) -> T {
  T::load(self.add(index))
}

///|
pub fn[T : Store + Sizeof] Pointer::op_set(
  self : Pointer[T],
  index : UInt64,
  value : T,
) -> Unit {
  T::store(self.add(index), value)
}

///|
pub fn[T : Load] Pointer::load(self : Pointer[T]) -> T {
  T::load(self)
}

///|
pub fn[T : Store] Pointer::store(self : Pointer[T], value : T) -> Unit {
  T::store(self, value)
}

///|
extern "c" fn pointer_to_uint64(pointer : Pointer[Unit]) -> UInt64 = "moonbit_tonyfettes_c_pointer_to_uint64"

///|
pub fn[T] Pointer::to_uint64(self : Pointer[T]) -> UInt64 {
  pointer_to_uint64(self.cast())
}

///|
pub fn[T] Pointer::from_array(array : FixedArray[T]) -> Pointer[T] = "%identity"

///|
#borrow(bytes)
extern "c" fn pointer_from_bytes(bytes : Bytes) -> Pointer[Byte] = "moonbit_tonyfettes_c_pointer_from_bytes"

///|
pub fn Pointer::from_bytes(bytes : Bytes) -> Pointer[Byte] {
  pointer_from_bytes(bytes)
}

///|
pub trait AsBytePtr {
  as_byte_ptr(self : Self) -> Pointer[Byte]
  as_byte_pointer(self : Self) -> Pointer[Byte] = _
}

///|
impl AsBytePtr with as_byte_pointer(self : Self) -> Pointer[Byte] {
  return AsBytePtr::as_byte_ptr(self)
}

///|
pub impl AsBytePtr for Pointer[Byte] with as_byte_ptr(
  self : Pointer[Byte],
) -> Pointer[Byte] {
  return self
}

///|
pub impl AsBytePtr for Bytes with as_byte_ptr(self : Bytes) -> Pointer[
  Byte,
] {
  return Pointer::from_bytes(self)
}

///|
pub impl AsBytePtr for FixedArray[Byte] with as_byte_ptr(
  self : FixedArray[Byte],
) -> Pointer[Byte] {
  return Pointer::from_array(self)
}

///|
pub traitalias AsBytePtr as AsBytePointer
