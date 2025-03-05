///|
fn main {
  @c.puts(b"stdout is printed to console") |> ignore()
  let file = @c.freopen(b"redir.txt", b"w", @c.stdout)
  if file is None {
    @c.perror(b"freopen() failed")
    @c.exit(@c.exit_failure)
  }
  @c.puts(b"stdout is redirected to a file") |> ignore() // this is written to redir.txt
  @c.fclose(@c.stdout) |> ignore()
}
