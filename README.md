# tonyfettes/c

FFI Binding to C standard library.

Rather than providing a convient API for interfacing with C standard library,
this library aims to truthfully reflect the C API into the MoonBit side. For
example, all `char *` in C code is mapped to `Pointer[Byte]` in this library, not
`Bytes`.
