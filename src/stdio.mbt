///|
extern type FILE

///|
extern "c" fn _puts(str : Pointer[Byte]) -> Int = "moonbit_c_puts"

pub fn puts(str : Bytes) -> Int {
  let str = [..str, b'\x00'] |> Pointer::of_bytes
  _puts(str)
}

///|
extern "c" fn _fopen(
  filename : Pointer[Byte],
  mode : Pointer[Byte]
) -> Nullable[FILE] = "moonbit_c_fopen"

///|
pub fn fopen(filename : Bytes, mode : Bytes) -> FILE? {
  let filename = [..filename, b'\x00'] |> Pointer::of_bytes
  let mode = [..mode, b'\x00'] |> Pointer::of_bytes
  _fopen(filename, mode).to()
}

///|
pub fn FILE::open(filename : Bytes, mode : Bytes) -> FILE? {
  fopen(filename, mode)
}

///|
extern "c" fn _freopen(
  filename : Pointer[Byte],
  mode : Pointer[Byte],
  stream : FILE
) -> Nullable[FILE] = "moonbit_c_freopen"

///|
pub fn freopen(filename : Bytes, mode : Bytes, stream : FILE) -> FILE? {
  let filename = [..filename, b'\x00'] |> Pointer::of_bytes
  let mode = [..mode, b'\x00'] |> Pointer::of_bytes
  _freopen(filename, mode, stream).to()
}

///|
pub fn FILE::reopen(self : FILE, filename : Bytes, mode : Bytes) -> FILE? {
  freopen(filename, mode, self)
}

///|
pub extern "c" fn fclose(stream : FILE) -> Int = "moonbit_c_fclose"

///|
pub fn FILE::close(self : FILE) -> Int {
  fclose(self)
}

///|
pub extern "c" fn fflush(stream : FILE) -> Int = "moonbit_c_fflush"

///|
pub extern "c" fn remove(pathname : Pointer[Byte]) -> Int = "moonbit_c_remove"

///|
extern "c" fn get_stdin() -> FILE = "moonbit_c_get_stdin"

///|
pub let stdin : FILE = get_stdin()

///|
extern "c" fn get_stdout() -> FILE = "moonbit_c_get_stdout"

///|
pub let stdout : FILE = get_stdout()

///|
extern "c" fn get_stderr() -> FILE = "moonit_c_get_stderr"

///|
pub let stderr : FILE = get_stderr()

///|
pub extern "c" fn ftell(stream : FILE) -> Int = "moonbit_c_ftell"

///|
pub extern "c" fn feof(stream : FILE) -> Int = "moonbit_c_feof"

///|
pub extern "c" fn fputs(str : Pointer[Byte], stream : FILE) -> Int = "moonbit_c_fputs"

///|
extern "c" fn _fwrite(
  buffer : Pointer[Unit],
  size : UInt64,
  count : UInt64,
  stream : FILE
) -> UInt64 = "moonbit_c_fwrite"

///|
pub fn fwrite[Buffer : Memory](
  buffer : Buffer,
  length? : UInt64,
  stream : FILE
) -> UInt64 {
  let length = match length {
    None => buffer.length()
    Some(length) => length
  }
  _fwrite(buffer.pointer(), buffer.sizeof(), length, stream)
}

///|
pub fn FILE::write[Buffer : Memory](
  self : FILE,
  buffer : Buffer,
  length? : UInt64
) -> UInt64 {
  fwrite(buffer, length?, self)
}

///|
extern "c" fn _fread(
  buffer : Pointer[Unit],
  size : UInt64,
  count : UInt64,
  stream : FILE
) -> UInt64 = "moonbit_c_fread"

///|
pub fn fread[Buffer : Memory](
  buffer : Buffer,
  length? : UInt64,
  stream : FILE
) -> UInt64 {
  let length = match length {
    None => buffer.length()
    Some(count) => count
  }
  _fread(buffer.pointer(), buffer.sizeof(), length, stream)
}

///|
extern "c" fn _perror(s : Pointer[Byte]) -> Unit = "moonbit_c_perror"

pub fn perror(s : Bytes) -> Unit {
  let s = [..s, b'\x00'] |> Pointer::of_bytes
  _perror(s)
}

///|
pub extern "c" fn get_eof() -> Int = "moonbit_c_get_eof"

///|
pub let eof : Int = get_eof()
