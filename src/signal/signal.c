#include <moonbit.h>
#include <signal.h>

MOONBIT_FFI_EXPORT
int32_t
moonbit_tonyfettes_c_signal_handler_equal(
  void (*handler1)(int),
  void (*handler2)(int)
) {
  return handler1 == handler2;
}

MOONBIT_FFI_EXPORT
void (*moonbit_tonyfettes_c_signal_SIG_DFL(void))(int) { return SIG_DFL; }

MOONBIT_FFI_EXPORT
void (*moonbit_tonyfettes_c_signal_SIG_IGN(void))(int) { return SIG_IGN; }

MOONBIT_FFI_EXPORT
void (*moonbit_tonyfettes_c_signal_SIG_ERR(void))(int) { return SIG_ERR; }

MOONBIT_FFI_EXPORT
int32_t
moonbit_tonyfettes_c_signal_SIGABRT(void) {
  return SIGABRT;
}

MOONBIT_FFI_EXPORT
int32_t
moonbit_tonyfettes_c_signal_SIGFPE(void) {
  return SIGFPE;
}

MOONBIT_FFI_EXPORT
int32_t
moonbit_tonyfettes_c_signal_SIGILL(void) {
  return SIGILL;
}

MOONBIT_FFI_EXPORT
int32_t
moonbit_tonyfettes_c_signal_SIGINT(void) {
  return SIGINT;
}

MOONBIT_FFI_EXPORT
int32_t
moonbit_tonyfettes_c_signal_SIGSEGV(void) {
  return SIGSEGV;
}

MOONBIT_FFI_EXPORT
int32_t
moonbit_tonyfettes_c_signal_SIGTERM(void) {
  return SIGTERM;
}
