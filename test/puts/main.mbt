///|
fn main {
  let rc = {
    b"Hello, World\x00"
    |> @c.Pointer::of_bytes()
    |> @c.puts()
  }
  if rc == @c.eof {
    b"puts() failed\x00"
    |> @c.Pointer::of_bytes()
    |> @c.perror()
  }
}
