#include <moonbit.h>
#include <setjmp.h>

MOONBIT_FFI_EXPORT
int32_t
moonbit_tonyfettes_c_sizeof_jmp_buf() {
  return sizeof(jmp_buf);
}

MOONBIT_FFI_EXPORT
void
moonbit_tonyfettes_c_longjmp(void *env, int val) {
  longjmp(env, val);
}

MOONBIT_FFI_EXPORT
int32_t
moonbit_tonyfettes_c_setjmp(
  void *env,
  void (*func)(void *, int32_t),
  void *data
) {
  if (setjmp(env) == 0) {
    func(data, 0);
    return 0;
  } else {
    func(data, 1);
    return 1;
  }
}
