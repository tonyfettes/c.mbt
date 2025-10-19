///|
extern "c" fn c_remove(path : @c.Pointer[Byte]) -> Int = "remove"

///|
pub fn[Path : @c.BytesLike] remove(path : Path) -> Unit raise @errno.Errno {
  let result = @c.borrow_bytes(path, path => c_remove(path))
  if result != 0 {
    raise @errno.Errno(@errno.get())
  }
}
