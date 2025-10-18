///|
#borrow(path, mode)
extern "c" fn c_fopen(path : @c.Pointer[Byte], mode : @c.Pointer[Byte]) -> FILE = "fopen"

///|
pub fn[Path : @c.AsBytePtr, Mode : @c.AsBytePtr] fopen(
  path : Path,
  mode : Mode,
) -> FILE raise @errno.Errno {
  let file = c_fopen(path.as_byte_ptr(), mode.as_byte_ptr())
  if file.is_null() {
    raise @errno.Errno(@errno.get())
  } else {
    file
  }
}
