///|
fn main {
  let path = @c.calloc(@c.l_tmpnam + 1) |> @c.tmpnam()
  let mode = b"r" |> @moonbit.bytes_to_ntbs()
  let fp : @c.Ptr[@c.FILE] = @c.fopen(path, mode)
  @c.free(path)
  @c.free(mode)
  if fp.is_null() {
    let error = @c.errno() |> @c.strerror() |> @moonbit.bytes_of_ntbs()
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
