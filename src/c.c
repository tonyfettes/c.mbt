#include <errno.h>
#include <locale.h>
#include <memory.h>
#include <moonbit.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>

int
moonbit_c_is_null(void *ptr) {
  return ptr == NULL;
}
char
moonbit_c_load_char(char *ptr) {
  return *ptr;
}
int
moonbit_c_load_int(int *ptr) {
  return *ptr;
}
float
moonbit_c_load_float(float *ptr) {
  return *ptr;
}
double
moonbit_c_load_double(double *ptr) {
  return *ptr;
}
void
moonbit_c_store_char(char *ptr, char val) {
  *ptr = val;
}
void
moonbit_c_store_int(int *ptr, int val) {
  *ptr = val;
}
void
moonbit_c_store_float(float *ptr, float val) {
  *ptr = val;
}
void
moonbit_c_store_double(double *ptr, double val) {
  *ptr = val;
}
uint64_t
moonbit_c_ptr_to_uint64(void *ptr) {
  return (uint64_t)ptr;
}
void *
moonbit_c_ptr_of_uint64(uint64_t ptr) {
  return (void *)ptr;
}
bool
moonbit_c_pointer_equal(void *ptr1, void *ptr2) {
  return ptr1 == ptr2;
}
void *
moonbit_c_malloc(uint64_t size) {
  return malloc(size);
}
void *
moonbit_c_calloc(uint64_t num, uint64_t size) {
  return calloc(num, size);
}
void *
moonbit_c_realloc(void *ptr, uint64_t size) {
  return realloc(ptr, size);
}
void
moonbit_c_free(void *ptr) {
  free(ptr);
}
void *
moonbit_c_memcpy(void *dest, void *src, uint64_t count) {
  return memcpy(dest, src, count);
}

uint64_t
moonbit_c_strlen(char *str) {
  return strlen(str);
}

FILE *
moonbit_c_get_stdin() {
  return stdin;
}
FILE *
moonbit_c_get_stdout() {
  return stdout;
}
FILE *
moonbit_c_get_stderr() {
  return stderr;
}
int
moonbit_c_get_eof() {
  return EOF;
}
int
moonbit_c_puts(const char *str) {
  return puts(str);
}
char *
moonbit_c_strerror(int errnum) {
  return strerror(errnum);
}
FILE *
moonbit_c_fopen(const char *filename, const char *mode) {
  return fopen(filename, mode);
}
int
moonbit_c_fclose(FILE *stream) {
  return fclose(stream);
}
int
moonbit_c_fflush(FILE *stream) {
  return fflush(stream);
}
void
moonbit_c_setbuf(FILE *stream, char *buf) {
  return setbuf(stream, buf);
}
int
moonbit_c_setvbuf(FILE *stream, char *buf, int mode, size_t size) {
  return setvbuf(stream, buf, mode, size);
}
size_t
moonbit_c_fread(void *restrict buffer, size_t size, size_t count, FILE *restrict stream) {
  return fread(buffer, size, count, stream);
}
size_t
moonbit_c_fwrite(const void *restrict buffer, size_t size, size_t count, FILE *restrict stream) {
  return fwrite(buffer, size, count, stream);
}
int
moonbit_c_remove(const char *filename) {
  return remove(filename);
}
FILE *
moonbit_c_freopen(const char *filename, const char *mode, FILE *stream) {
  return freopen(filename, mode, stream);
}
int
moonbit_c_ftell(FILE *stream) {
  return ftell(stream);
}
int
moonbit_c_feof(FILE *stream) {
  return feof(stream);
}
int
moonbit_c_fputs(const char *str, FILE *stream) {
  return fputs(str, stream);
}
void
moonbit_c_perror(const char *str) {
  perror(str);
}

void
moonbit_c_exit(int status) {
  exit(status);
}
int
moonbit_c_get_exit_success() {
  return EXIT_SUCCESS;
}
int
moonbit_c_get_exit_failure() {
  return EXIT_FAILURE;
}

int
moonbit_c_get_errno() {
  return errno;
}
void
moonbit_c_set_errno(int err) {
  errno = err;
}

int
moonbit_c_get_lc_all() {
  return LC_ALL;
}
char *
moonbit_c_setlocale(int category, const char *locale) {
  return setlocale(category, locale);
}
