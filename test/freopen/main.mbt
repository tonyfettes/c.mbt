///|
fn main {
  b"stdout is printed to console" |> @c.bytes_to_ntbs() |> @c.puts() |> ignore()
  let path = b"redir.txt" |> @c.bytes_to_ntbs()
  let mode = b"w" |> @c.bytes_to_ntbs()
  if @c.freopen(path, mode, @c.stdout).is_null() {
    @c.perror(b"freopen() failed" |> @c.bytes_to_ntbs())
    @c.exit(@c.exit_failure)
  }
  b"stdout is redirected to a file"
  |> @c.bytes_to_ntbs()
  |> @c.puts()
  |> ignore() // this is written to redir.txt
  @c.fclose(@c.stdout) |> ignore()
}
