///|
fn main {
  try {
    let fp = @c.fopen(b"non_existent_file.txt", b"r")
    if fp is None {
      let error = @c.errno() |> @c.strerror()
      let error = Bytes::makei(@c.strlen(error).to_int(), fn(i) { error[i] })
      let decoder = @encoding.decoder(UTF8)
      let error = decoder.decode!(error).to_string()
      println("File opening error: \{error}")
      let locale = b"en_US.utf8\x00" |> @c.Pointer::of_bytes()
      let _ = @c.setlocale(@c.lc_all, locale)
      let error = @c.errno() |> @c.strerror()
      let error = Bytes::makei(@c.strlen(error).to_int(), fn(i) { error[i] })
      let error = decoder.decode!(error).to_string()
      println("Now in German: \{error}")
    }
  } catch {
    error => {
      println("Error: \{error}")
      @c.exit(@c.exit_failure)
    }
  }
}
