///|
extern "c" fn c_EOF() -> Int = "moonbit_tonyfettes_c_stdio_EOF"

///|
pub let eof : Int = c_EOF()

///|
extern "c" fn c_stdin() -> FILE = "moonbit_tonyfettes_c_stdio_stdin"

///|
pub let stdin : FILE = c_stdin()

///|
extern "c" fn c_stdout() -> FILE = "moonbit_tonyfettes_c_stdio_stdout"

///|
pub let stdout : FILE = c_stdout()

///|
extern "c" fn c_stderr() -> FILE = "moonbit_tonyfettes_c_stdio_stderr"

///|
pub let stderr : FILE = c_stderr()
