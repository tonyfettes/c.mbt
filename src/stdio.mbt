///|
type FILE

///|
pub extern "c" fn puts(str : Ptr[Byte]) -> Int = "moonbit_c_puts"

///|
pub extern "c" fn fopen(filename : Ptr[Byte], mode : Ptr[Byte]) -> Ptr[FILE] = "moonbit_c_fopen"

///|
pub extern "c" fn freopen(
  filename : Ptr[Byte],
  mode : Ptr[Byte],
  stream : Ptr[FILE]
) -> Ptr[FILE] = "moonbit_c_freopen"

///|
pub extern "c" fn fclose(stream : Ptr[FILE]) -> Int = "moonbit_c_fclose"

///|
pub extern "c" fn remove(pathname : Ptr[Byte]) -> Int = "moonbit_c_remove"

///|
extern "c" fn get_stdin() -> Ptr[FILE] = "moonbit_c_get_stdin"

///|
pub let stdin : Ptr[FILE] = get_stdin()

///|
extern "c" fn get_stdout() -> Ptr[FILE] = "moonbit_c_get_stdout"

///|
pub let stdout : Ptr[FILE] = get_stdout()

///|
extern "c" fn get_stderr() -> Ptr[FILE] = "moonit_c_get_stderr"

///|
pub let stderr : Ptr[FILE] = get_stderr()

///|
pub extern "c" fn ftell(stream : Ptr[FILE]) -> Int = "moonbit_c_ftell"

///|
pub extern "c" fn feof(stream : Ptr[FILE]) -> Int = "moonbit_c_feof"

///|
pub extern "c" fn fputs(str : Ptr[Byte], stream : Ptr[FILE]) -> Int = "moonbit_c_fputs"

///|
pub extern "c" fn fwrite(
  buffer : Ptr[Byte],
  size : UInt64,
  count : UInt64,
  stream : Ptr[FILE]
) -> UInt64 = "moonbit_c_fwrite"

///|
pub extern "c" fn perror(s : Ptr[Byte]) -> Unit = "moonbit_c_perror"

///|
pub extern "c" fn get_eof() -> Int = "moonbit_c_get_eof"

///|
pub let eof : Int = get_eof()
