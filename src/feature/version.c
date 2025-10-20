#include <moonbit.h>

MOONBIT_FFI_EXPORT
int64_t
moonbit_tonyfettes_c_feature_version(void) {
#ifdef __STDC_VERSION__
  return __STDC_VERSION__;
#else
  return -1;
#endif
}
