#include <moonbit.h>
#include <setjmp.h>
#include <stdio.h>

MOONBIT_FFI_EXPORT
int32_t
moonbit_tonyfettes_c_sizeof_jmp_buf() {
  return sizeof(jmp_buf);
}

MOONBIT_FFI_EXPORT
void
moonbit_tonyfettes_c_longjmp(void *env, int val) {
  fprintf(stderr, "Calling longjmp with env=%p, val=%d\n", env, val);
  longjmp(env, val);
}

MOONBIT_FFI_EXPORT
int32_t
moonbit_tonyfettes_c_setjmp(
  void *env,
  void (*setjmp_func)(void *),
  void *setjmp_data,
  void (*longjmp_func)(void *),
  void *longjmp_data
) {
  fprintf(stderr, "Calling setjmp with env=%p\n", env);
  if (setjmp(env) == 0) {
    setjmp_func(setjmp_data);
    return 0;
  } else {
    longjmp_func(longjmp_data);
    return 1;
  }
}
