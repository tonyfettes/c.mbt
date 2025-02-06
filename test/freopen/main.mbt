///|
fn main {
  let msg = b"stdout is printed to console\x00" |> @moonbit.bytes_to_ntbs()
  @c.puts(msg) |> ignore()
  @c.free(msg)
  let path = b"redir.txt\x00" |> @moonbit.bytes_to_ntbs()
  let mode = b"w\x00" |> @moonbit.bytes_to_ntbs()
  let file = @c.freopen(path, mode, @c.stdout)
  @c.free(path)
  @c.free(mode)
  if file.is_null() {
    let err_msg = b"freopen() failed\x00" |> @moonbit.bytes_to_ntbs()
    @c.perror(err_msg)
    @c.free(err_msg)
    @c.exit(@c.exit_failure)
  }
  let msg = b"stdout is redirected to a file\x00" |> @moonbit.bytes_to_ntbs()
  @c.puts(msg) |> ignore() // this is written to redir.txt
  @c.free(msg)
  @c.fclose(@c.stdout) |> ignore()
}
