///|
#external
pub type Handler

///|
pub fn handler(f : FuncRef[(Int) -> Unit]) -> Handler = "%identity"

///|
extern "c" fn c_signal(sig : Int, handler : Handler) -> Handler = "signal"

///|
pub fn signal(sig : Int, handler : Handler) -> Handler {
  c_signal(sig, handler)
}

///|
extern "c" fn c_sig_dfl() -> Handler = "moonbit_c_SIG_DFL"

///|
pub let sig_dfl : Handler = c_sig_dfl()

///|
extern "c" fn c_sig_ign() -> Handler = "moonbit_c_SIG_IGN"

///|
pub let sig_ign : Handler = c_sig_ign()

///|
extern "c" fn c_sig_err() -> Handler = "moonbit_c_SIG_ERR"

///|
pub let sig_err : Handler = c_sig_err()

///|
extern "c" fn c_sigabrt() -> Int = "moonbit_c_SIGABRT"

///|
pub let sigabrt : Int = c_sigabrt()

///|
extern "c" fn c_sigfpe() -> Int = "moonbit_c_SIGFPE"

///|
pub let sigfpe : Int = c_sigfpe()

///|
extern "c" fn c_sigill() -> Int = "moonbit_c_SIGILL"

///|
pub let sigill : Int = c_sigill()

///|
extern "c" fn c_sigint() -> Int = "moonbit_c_SIGINT"

///|
pub let sigint : Int = c_sigint()

///|
extern "c" fn c_sigsegv() -> Int = "moonbit_c_SIGSEGV"

///|
pub let sigsegv : Int = c_sigsegv()

///|
extern "c" fn c_sigterm() -> Int = "moonbit_c_SIGTERM"

///|
pub let sigterm : Int = c_sigterm()
