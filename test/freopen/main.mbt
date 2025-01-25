///|
fn main {
  b"stdout is printed to console\x00"
  |> @moonbit.bytes_data()
  |> @c.puts()
  |> ignore()
  let path = b"redir.txt\x00" |> @moonbit.bytes_data()
  let mode = b"w\x00" |> @moonbit.bytes_data()
  if @c.freopen(path, mode, @c.stdout).is_null() {
    @c.perror(b"freopen() failed\x00" |> @moonbit.bytes_data())
    @c.exit(@c.exit_failure)
  }
  b"stdout is redirected to a file\x00"
  |> @moonbit.bytes_data()
  |> @c.puts()
  |> ignore() // this is written to redir.txt
  @c.fclose(@c.stdout) |> ignore()
}
