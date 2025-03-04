///|
fn main {
  let path = @c.calloc(@c.l_tmpnam + 1) |> @c.tmpnam()
  let mode = b"r".to_fixedarray() |> @memory.Memory::of_array()
  let fp : @c.Pointer[@c.FILE] = @c.fopen(path, mode |> @c.Pointer::of_memory())
  @c.free(path)
  @memory.free(mode)
  if fp.is_null() {
    let error = @c.errno() |> @c.strerror()
    let memory : @memory.Memory[Byte] = @memory.malloc(
      @c.strlen(error).to_int(),
    )
    let error = @encoding.decode_strict(UTF8, error).to_string?().unwrap()
    println("File opening error: \{error}")
    let locale = b"en_US.utf8" |> @moonbit.bytes_to_ntbs()
    let _ = @c.setlocale(@c.lc_all, locale)
    @c.free(locale)
    let error = @c.errno() |> @c.strerror() |> @moonbit.bytes_of_ntbs()
    let error = @encoding.decode_strict(UTF8, error).to_string?().unwrap()
    println("Now in German: \{error}")
  }
}
