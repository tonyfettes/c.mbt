///|
pub extern "c" fn memcpy(
  dest : Ptr[Unit],
  src : Ptr[Unit],
  count : UInt64
) -> Ptr[Unit] = "moonbit_c_memcpy"
