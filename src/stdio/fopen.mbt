///|
#borrow(path, mode)
extern "c" fn c_fopen(path : @c.Pointer[Byte], mode : @c.Pointer[Byte]) -> FILE = "moonbit_tonyfettes_c_stdio_fopen"

///|
pub fn[Path : @c.BytesLike, Mode : @c.BytesLike] fopen(
  path : Path,
  mode : Mode,
) -> FILE raise @errno.Errno {
  let file = @c.borrow_bytes_2(path, mode, (path, mode) => c_fopen(path, mode))
  if file.is_null() {
    raise @errno.Errno(@errno.get())
  } else {
    file
  }
}
