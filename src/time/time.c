
#include "moonbit.h"
#include <time.h>
#include <stdlib.h>

MOONBIT_FFI_EXPORT
uint64_t
moonbit_tonyfettes_c_time(void) {
  return (uint64_t)time(NULL);
}

MOONBIT_FFI_EXPORT
double
moonbit_tonyfettes_c_difftime(uint64_t time_end, uint64_t time_beg) {
  return difftime((time_t)time_end, (time_t)time_beg);
}

MOONBIT_FFI_EXPORT
struct tm *
moonbit_tonyfettes_c_localtime(const uint64_t time) {
  time_t t = (time_t)time;
  return localtime(&t);
}

MOONBIT_FFI_EXPORT
struct tm *
moonbit_tonyfettes_c_gmtime(const uint64_t time) {
  time_t t = (time_t)time;
  return gmtime(&t);
}

MOONBIT_FFI_EXPORT
int32_t
moonbit_tonyfettes_c_tm_sec(const struct tm *tm) {
  return (int32_t)tm->tm_sec;
}

MOONBIT_FFI_EXPORT
uint64_t
moonbit_tonyfettes_c_tm_sizeof(void) {
  return (uint64_t)sizeof(struct tm);
}

MOONBIT_FFI_EXPORT
int32_t
moonbit_tonyfettes_c_tm_min(const struct tm *tm) {
  return (int32_t)tm->tm_min;
}

MOONBIT_FFI_EXPORT
int32_t
moonbit_tonyfettes_c_tm_hour(const struct tm *tm) {
  return (int32_t)tm->tm_hour;
}

MOONBIT_FFI_EXPORT
int32_t
moonbit_tonyfettes_c_tm_mday(const struct tm *tm) {
  return (int32_t)tm->tm_mday;
}

MOONBIT_FFI_EXPORT
int32_t
moonbit_tonyfettes_c_tm_mon(const struct tm *tm) {
  return (int32_t)tm->tm_mon;
}

MOONBIT_FFI_EXPORT
int32_t
moonbit_tonyfettes_c_tm_year(const struct tm *tm) {
  return (int32_t)tm->tm_year;
}

MOONBIT_FFI_EXPORT
int32_t
moonbit_tonyfettes_c_tm_wday(const struct tm *tm) {
  return (int32_t)tm->tm_wday;
}

MOONBIT_FFI_EXPORT
int32_t
moonbit_tonyfettes_c_tm_yday(const struct tm *tm) {
  return (int32_t)tm->tm_yday;
}

MOONBIT_FFI_EXPORT
int32_t
moonbit_tonyfettes_c_tm_isdst(const struct tm *tm) {
  return (int32_t)tm->tm_isdst;
}

MOONBIT_FFI_EXPORT
uint64_t
moonbit_tonyfettes_c_mktime(struct tm *tm) {
  return (uint64_t)mktime(tm);
}

MOONBIT_FFI_EXPORT
uint64_t
moonbit_tonyfettes_c_strftime(
  uint8_t *str,
  int32_t len,
  uint8_t *format,
  const struct tm *tm
) {
  return (uint64_t)strftime((char *)str, len, (const char *)format, tm);
}

MOONBIT_FFI_EXPORT
uint64_t
moonbit_tonyfettes_c_clock(void) {
  return (uint64_t)clock();
}

MOONBIT_FFI_EXPORT
uint64_t
moonbit_tonyfettes_c_clocks_per_sec(void) {
  return (uint64_t)CLOCKS_PER_SEC;
}
