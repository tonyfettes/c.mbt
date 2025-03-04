///|
fn main {
  b"stdout is printed to console\x00"
  |> @c.Pointer::of_bytes()
  |> @c.puts()
  |> ignore()
  let path = b"redir.txt\x00" |> @c.Pointer::of_bytes()
  let mode = b"w\x00" |> @c.Pointer::of_bytes()
  let file = @c.freopen(path, mode, @c.stdout)
  if file.is_null() {
    b"freopen() failed\x00"
    |> @c.Pointer::of_bytes()
    |> @c.perror()
    @c.exit(@c.exit_failure)
  }
  b"stdout is redirected to a file\x00"
  |> @c.Pointer::of_bytes()
  |> @c.puts()
  |> ignore() // this is written to redir.txt
  @c.fclose(@c.stdout) |> ignore()
}
