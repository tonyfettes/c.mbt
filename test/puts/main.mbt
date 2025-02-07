///|
fn main {
  let msg = b"Hello, World" |> @moonbit.bytes_to_ntbs()
  let rc = @c.puts(msg)
  @c.free(msg)
  if rc == @c.eof {
    let err_msg = b"puts() failed" |> @moonbit.bytes_to_ntbs()
    @c.perror(err_msg)
    @c.free(err_msg)
  }
}
