///|
extern "c" fn c_freopen(
  path : @c.Pointer[Byte],
  mode : @c.Pointer[Byte],
  stream : FILE,
) -> FILE = "freopen"

///|
pub fn[Path : @c.AsBytePtr, Mode : @c.AsBytePtr] freopen(
  path : Path,
  mode : Mode,
  stream : FILE,
) -> FILE raise @errno.Errno {
  let file = c_freopen(path.as_byte_ptr(), mode.as_byte_ptr(), stream)
  if file.is_null() {
    raise @errno.Errno(@errno.get())
  } else {
    file
  }
}
