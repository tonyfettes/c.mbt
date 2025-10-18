///|
extern "c" fn c_fflush(stream : FILE) -> Int = "fflush"

///|
pub fn[T : IsNullableFILE] fflush(stream : T) -> Unit raise @errno.Errno {
  if c_fflush(stream.to_file()) != 0 {
    raise @errno.Errno(@errno.get())
  }
}
