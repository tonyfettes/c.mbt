///|
extern type FILE

///|
pub extern "c" fn puts(str : Pointer[Byte]) -> Int = "moonbit_c_puts"

///|
pub extern "c" fn fopen(
  filename : Pointer[Byte],
  mode : Pointer[Byte]
) -> Pointer[FILE] = "moonbit_c_fopen"

///|
pub extern "c" fn freopen(
  filename : Pointer[Byte],
  mode : Pointer[Byte],
  stream : Pointer[FILE]
) -> Pointer[FILE] = "moonbit_c_freopen"

///|
pub extern "c" fn fclose(stream : Pointer[FILE]) -> Int = "moonbit_c_fclose"

pub extern "c" fn fflush(stream : Pointer[FILE]) -> Int = "moonbit_c_fflush"

///|
pub extern "c" fn remove(pathname : Pointer[Byte]) -> Int = "moonbit_c_remove"

///|
extern "c" fn get_stdin() -> Pointer[FILE] = "moonbit_c_get_stdin"

///|
pub let stdin : Pointer[FILE] = get_stdin()

///|
extern "c" fn get_stdout() -> Pointer[FILE] = "moonbit_c_get_stdout"

///|
pub let stdout : Pointer[FILE] = get_stdout()

///|
extern "c" fn get_stderr() -> Pointer[FILE] = "moonit_c_get_stderr"

///|
pub let stderr : Pointer[FILE] = get_stderr()

///|
pub extern "c" fn ftell(stream : Pointer[FILE]) -> Int = "moonbit_c_ftell"

///|
pub extern "c" fn feof(stream : Pointer[FILE]) -> Int = "moonbit_c_feof"

///|
pub extern "c" fn fputs(str : Pointer[Byte], stream : Pointer[FILE]) -> Int = "moonbit_c_fputs"

///|
extern "c" fn _fwrite(
  buffer : Pointer[Byte],
  size : UInt64,
  count : UInt64,
  stream : Pointer[FILE]
) -> UInt64 = "moonbit_c_fwrite"

///|
pub fn fwrite[Size : ToUInt64, Count : ToUInt64](
  buffer : Pointer[Byte],
  size : Size,
  count : Count,
  stream : Pointer[FILE]
) -> UInt64 {
  _fwrite(buffer, size.to_uint64(), count.to_uint64(), stream)
}

extern "c" fn _fread(
  buffer : Pointer[Byte],
  size : UInt64,
  count : UInt64,
  stream : Pointer[FILE]
) -> UInt64 = "moonbit_c_fread"

pub fn fread[Size : ToUInt64, Count : ToUInt64](
  buffer : Pointer[Byte],
  size : Size,
  count : Count,
  stream : Pointer[FILE]
) -> UInt64 {
  _fread(buffer, size.to_uint64(), count.to_uint64(), stream)
}

///|
pub extern "c" fn perror(s : Pointer[Byte]) -> Unit = "moonbit_c_perror"

///|
pub extern "c" fn get_eof() -> Int = "moonbit_c_get_eof"

///|
pub let eof : Int = get_eof()
