///|
fn main {
  let a : FixedArray[Double] = [1, 2, 3, 4, 5]
  let a_ptr = a |> @c.Pointer::of_array()
  let name = b"file.bin\x00" |> @c.Pointer::of_bytes()
  let wb = b"wb\x00" |> @c.Pointer::of_bytes()
  let f1 = @c.fopen(name, wb).to()
  guard f1 is Some(f1)
  let r1 = @c.fwrite(a_ptr.cast(), @c.sizeof(@c.double), a.length(), f1)
  println("wrote \{r1} elements out of \{a.length()} requested")
  @c.fclose(f1) |> ignore()
  let b : @c.Pointer[Double] = @c.calloc(a.length())
  let rb = b"rb\x00" |> @c.Pointer::of_bytes()
  let f2 = @c.fopen(name, rb).to()
  guard f2 is Some(f2)
  let r2 = @c.fread(b.cast(), @c.sizeof(@c.double), a.length(), f2)
  @c.fclose(f2) |> ignore()
  println("read back: ")
  for i in 0..<r2.to_int() {
    println("\{b[i]}")
  }
  @c.free(b)
}
