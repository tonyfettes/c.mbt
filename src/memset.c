#include <moonbit.h>
#include <string.h>

MOONBIT_FFI_EXPORT
void
moonbit_c_memset(void *dst, int32_t val, uint64_t len) {
  memset(dst, val, len);
}
