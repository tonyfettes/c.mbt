#include <moonbit.h>

MOONBIT_FFI_EXPORT
int32_t
moonbit_tonyfettes_c_feature_no_threads(void) {
#if defined (__STDC_NO_THREADS__)
  return 1;
#else
  return 0;
#endif
}
