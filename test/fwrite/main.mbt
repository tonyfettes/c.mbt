///|
fn main {
  let a : FixedArray[Double] = [1, 2, 3, 4, 5]
  let name = b"file.bin"
  let f1 = @c.fopen(name, b"wb")
  guard f1 is Some(f1)
  let r1 = f1.write(a)
  println("wrote \{r1} elements out of \{a.length()} requested")
  f1.close() |> ignore()
  let b = FixedArray::make(a.length(), 0.0)
  let f2 = @c.fopen(name, b"rb")
  guard f2 is Some(f2)
  let r2 = @c.fread(b, f2)
  @c.fclose(f2) |> ignore()
  println("read back: ")
  for i in 0..<r2.to_int() {
    println("\{b[i]}")
  }
}
