#include <moonbit.h>
#include <threads.h>

MOONBIT_FFI_EXPORT
int32_t
moonbit_tonyfettes_c_thrd_create(
  thrd_t *thread,
  int32_t (*func)(void *),
  void *arg
) {
  return thrd_create(thread, func, arg);
}
