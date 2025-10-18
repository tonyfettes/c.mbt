///|
extern "c" fn c_remove(path : @c.Pointer[Byte]) -> Int = "remove"

///|
pub fn[Path : @c.AsBytePtr] remove(path : Path) -> Unit raise @errno.Errno {
  let result = c_remove(path.as_byte_ptr())
  if result != 0 {
    raise @errno.Errno(@errno.get())
  }
}
