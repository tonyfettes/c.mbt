///|
extern "c" fn c_fflush(stream : FILE) -> Int = "fflush"

///|
pub fn fflush(stream : FILE) -> Unit raise @errno.Errno {
  if c_fflush(stream) != 0 {
    raise @errno.Errno(@errno.get())
  }
}
