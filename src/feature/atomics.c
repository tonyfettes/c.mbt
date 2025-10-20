#include <moonbit.h>

MOONBIT_FFI_EXPORT
int32_t
moonbit_tonyfettes_c_feature_no_atomics(void) {
#if defined(__STDC_NO_ATOMICS__)
  return 1;
#else
  return 0;
#endif
}
