#include <moonbit.h>
#include <string.h>

MOONBIT_FFI_EXPORT
uint64_t
moonbit_tonyfettes_c_string_strlen(const char *s) {
  return strlen(s);
}
