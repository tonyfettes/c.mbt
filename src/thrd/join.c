#include <moonbit.h>
#include <threads.h>

MOONBIT_FFI_EXPORT
int32_t
moonbit_tonyfettes_c_thrd_join(thrd_t *thread, int32_t *res) {
  return thrd_join(*thread, res);
}
