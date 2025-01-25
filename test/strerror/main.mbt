///|
fn main {
  let fp : @c.Ptr[@c.FILE] = @c.fopen(
    @c.tmpnam(@moonbit.bytes_data(Bytes::make(@c.l_tmpnam.to_int(), b'\x00'))),
    @moonbit.bytes_data(b"r\x00"),
  )
  if fp.is_null() {
    let error = @c.errno() |> @c.strerror() |> @moonbit.bytes_of_ntbs()
    let error = @encoding.decode_strict(UTF8, error).to_string?().unwrap()
    println("File opening error: \{error}")
    let _ = @c.setlocale(@c.lc_all, @moonbit.bytes_data(b"de_DE.utf8\x00"))
    let error = @c.errno() |> @c.strerror() |> @moonbit.bytes_of_ntbs()
    let error = @encoding.decode_strict(UTF8, error).to_string?().unwrap()
    println("Now in German: \{error}")
  }
}
