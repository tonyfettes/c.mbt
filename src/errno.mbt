///|
extern "c" fn get_errno() -> Int = "moonbit_c_get_errno"

///|
extern "c" fn set_errno(errno : Int) -> Unit = "moonbit_c_set_errno"

///|
pub fn errno(errno? : Int) -> Int {
  match errno {
    None => get_errno()
    Some(errno) => {
      set_errno(errno)
      errno
    }
  }
}
