///|
extern "c" fn c_fclose(stream : FILE) -> Int = "fclose"

///|
pub fn fclose(stream : FILE) -> Unit raise @errno.Errno {
  let result = c_fclose(stream)
  if result != 0 {
    raise @errno.Errno(@errno.get())
  }
}
