///|
trait Store {
  store(Pointer[Self], Self) -> Unit
}

///|
extern "c" fn pointer_store_byte(pointer : Pointer[Byte], value : Byte) -> Unit = "moonbit_tonyfettes_c_pointer_store_byte"

///|
extern "c" fn pointer_store_int16(
  pointer : Pointer[Int16],
  value : Int16,
) -> Unit = "moonbit_tonyfettes_c_pointer_store_int16"

///|
extern "c" fn pointer_store_uint16(
  pointer : Pointer[UInt16],
  value : UInt16,
) -> Unit = "moonbit_tonyfettes_c_pointer_store_uint16"

///|
extern "c" fn pointer_store_int(pointer : Pointer[Int], value : Int) -> Unit = "moonbit_tonyfettes_c_pointer_store_int"

///|
extern "c" fn pointer_store_uint(pointer : Pointer[UInt], value : UInt) -> Unit = "moonbit_tonyfettes_c_pointer_store_uint"

///|
extern "c" fn pointer_store_int64(
  pointer : Pointer[Int64],
  value : Int64,
) -> Unit = "moonbit_tonyfettes_c_pointer_store_int64"

///|
extern "c" fn pointer_store_uint64(
  pointer : Pointer[UInt64],
  value : UInt64,
) -> Unit = "moonbit_tonyfettes_c_pointer_store_uint64"

///|
extern "c" fn pointer_store_float(
  pointer : Pointer[Float],
  value : Float,
) -> Unit = "moonbit_tonyfettes_c_pointer_store_float"

///|
extern "c" fn pointer_store_double(
  pointer : Pointer[Double],
  value : Double,
) -> Unit = "moonbit_tonyfettes_c_pointer_store_double"

///|
extern "c" fn moonbit_tonyfettes_c_pointer_store_pointer(
  pointer : Pointer[Pointer[Unit]],
  value : Pointer[Unit],
) -> Unit = "moonbit_tonyfettes_c_pointer_store_pointer"

///|
pub impl Store for Byte with store(pointer : Pointer[Byte], value : Byte) -> Unit {
  pointer_store_byte(pointer, value)
}

///|
pub impl Store for Int16 with store(pointer : Pointer[Int16], value : Int16) -> Unit {
  pointer_store_int16(pointer, value)
}

///|
pub impl Store for UInt16 with store(pointer : Pointer[UInt16], value : UInt16) -> Unit {
  pointer_store_uint16(pointer, value)
}

///|
pub impl Store for Int with store(pointer : Pointer[Int], value : Int) -> Unit {
  pointer_store_int(pointer, value)
}

///|
pub impl Store for UInt with store(pointer : Pointer[UInt], value : UInt) -> Unit {
  pointer_store_uint(pointer, value)
}

///|
pub impl Store for Int64 with store(pointer : Pointer[Int64], value : Int64) -> Unit {
  pointer_store_int64(pointer, value)
}

///|
pub impl Store for UInt64 with store(pointer : Pointer[UInt64], value : UInt64) -> Unit {
  pointer_store_uint64(pointer, value)
}

///|
pub impl Store for Float with store(pointer : Pointer[Float], value : Float) -> Unit {
  pointer_store_float(pointer, value)
}

///|
pub impl Store for Double with store(pointer : Pointer[Double], value : Double) -> Unit {
  pointer_store_double(pointer, value)
}

///|
pub impl[T] Store for Pointer[T] with store(
  pointer : Pointer[Pointer[T]],
  value : Pointer[T],
) -> Unit {
  moonbit_tonyfettes_c_pointer_store_pointer(pointer.cast(), value.cast())
}
