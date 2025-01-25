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
) -> Ptr[FILE] = "freopen"

///|
pub extern "c" fn fclose(stream : Ptr[FILE]) -> Int = "fclose"

///|
pub extern "c" fn remove(pathname : Ptr[Byte]) -> Int = "remove"

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
pub extern "c" fn ftell(stream : Ptr[FILE]) -> Int = "ftell"

///|
pub extern "c" fn feof(stream : Ptr[FILE]) -> Int = "feof"

///|
pub extern "c" fn fputs(str : Ptr[Byte], stream : Ptr[FILE]) -> Int = "fputs"

///|
pub extern "c" fn perror(s : Ptr[Byte]) -> Unit = "perror"

///|
pub extern "c" fn get_eof() -> Int = "moonbit_c_get_eof"

///|
pub let eof : Int = get_eof()

///|
pub extern "c" fn tmpnam(filename : Ptr[Byte]) -> Ptr[Byte] = "tmpnam"

///|
extern "c" fn get_l_tmpnam() -> UInt64 = "moonbit_c_get_l_tmpnam"

///|
pub let l_tmpnam : UInt64 = get_l_tmpnam()
