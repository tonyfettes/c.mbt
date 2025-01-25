///|
fn main {
  let rc = @c.puts(b"Hello, World" |> @c.bytes_to_ntbs)
  if rc == @c.eof {
    @c.perror(b"fputs()" |> @c.bytes_to_ntbs)
  }
}
