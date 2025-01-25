#include <memory.h>
#include <moonbit.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>

int moonbit_c_is_null(void *ptr) { return ptr == NULL; }
int moonbit_c_deref_int(int *ptr) { return *ptr; }
float moonbit_c_deref_float(float *ptr) { return *ptr; }
void moonbit_c_write_int(int *ptr, int val) { *ptr = val; }
void moonbit_c_write_float(float *ptr, float val) { *ptr = val; }
uint64_t moonbit_c_ptr_to_uint64(void *ptr) { return (uint64_t)ptr; }
void *moonbit_c_ptr_of_uint64(uint64_t ptr) { return (void *)ptr; }

void *moonbit_c_malloc(uint64_t size) { return malloc(size); }
void *moonbit_c_calloc(uint64_t num, uint64_t size) {
  return calloc(num, size);
}
void *moonbit_c_realloc(void *ptr, uint64_t size) { return realloc(ptr, size); }
void moonbit_c_free(void *ptr) { free(ptr); }

char *moonbit_c_bytes_data(struct moonbit_bytes *bytes) {
  return (char *)bytes->data;
}
uint64_t moonbit_c_strlen(char *str) { return strlen(str); }

FILE *moonbit_c_get_stdin() { return stdin; }
FILE *moonbit_c_get_stdout() { return stdout; }
FILE *moonbit_c_get_stderr() { return stderr; }
int moonbit_c_get_eof() { return EOF; }
int moonbit_c_puts(const char *str) { return puts(str); }

void moonbit_c_exit(int status) { exit(status); }
int moonbit_c_get_exit_success() { return EXIT_SUCCESS; }
int moonbit_c_get_exit_failure() { return EXIT_FAILURE; }
