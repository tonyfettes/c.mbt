#include <moonbit.h>
#include <stdlib.h>

MOONBIT_FFI_EXPORT
int32_t
moonbit_tonyfettes_c_exit_success(void) {
  return EXIT_SUCCESS;
}

MOONBIT_FFI_EXPORT
int32_t
moonbit_tonyfettes_c_exit_failure(void) {
  return EXIT_FAILURE;
}
