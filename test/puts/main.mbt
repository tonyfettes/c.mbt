///|
fn main {
  let rc = @c.puts(b"Hello, World")
  if rc == @c.eof {
    @c.perror(b"puts() failed")
  }
}
