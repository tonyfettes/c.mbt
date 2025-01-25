///|
fn main {
  let rc = @c.puts(b"Hello, World\x00" |> @moonbit.bytes_data)
  if rc == @c.eof {
    @c.perror(b"fputs()\x00" |> @moonbit.bytes_data)
  }
}
