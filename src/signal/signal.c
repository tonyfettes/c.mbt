#include <moonbit.h>
#include <signal.h>

MOONBIT_FFI_EXPORT
void (*moonbit_c_SIG_DFL(void))(int) { return SIG_DFL; }

MOONBIT_FFI_EXPORT
void (*moonbit_c_SIG_IGN(void))(int) { return SIG_IGN; }

MOONBIT_FFI_EXPORT
void (*moonbit_c_SIG_ERR(void))(int) { return SIG_ERR; }

MOONBIT_FFI_EXPORT
int32_t
moonbit_c_SIGABRT(void) {
  return SIGABRT;
}

MOONBIT_FFI_EXPORT
int32_t
moonbit_c_SIGFPE(void) {
  return SIGFPE;
}

MOONBIT_FFI_EXPORT
int32_t
moonbit_c_SIGILL(void) {
  return SIGILL;
}

MOONBIT_FFI_EXPORT
int32_t
moonbit_c_SIGINT(void) {
  return SIGINT;
}

MOONBIT_FFI_EXPORT
int32_t
moonbit_c_SIGSEGV(void) {
  return SIGSEGV;
}

MOONBIT_FFI_EXPORT
int32_t
moonbit_c_SIGTERM(void) {
  return SIGTERM;
}
