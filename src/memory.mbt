///|
pub extern "c" fn memcpy(
  dest : Pointer[Unit],
  src : Pointer[Unit],
  count : UInt64
) -> Pointer[Unit] = "moonbit_c_memcpy"
