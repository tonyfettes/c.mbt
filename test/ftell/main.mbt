///|
fn main {
  try {
    // Prepare an array of FP values. */
    let a : FixedArray[Double] = [1.1, 2.0, 3.0, 4.0, 5.0]

    // Write array to a file. */
    let fname = b"test.bin"
    let file = @c.fopen(fname, b"wb")
    guard file is Some(file)
    let write_count = file.write(a)
    println("write_count: \{write_count}")
    assert_eq!(write_count, a.length().to_uint64())
    @c.fflush(file) |> ignore()
    @c.fclose(file) |> ignore()

    // Read the FP values into array B. */
    let b = FixedArray::make(a.length(), 0.0)
    let file = @c.fopen(fname, b"rb")
    guard file is Some(file)
    let pos = @c.ftell(file)
    assert_not_eq!(pos, -1)
    let read_count = @c.fread(b, file)
    assert_eq!(read_count, 1)
    let pos = @c.ftell(file)
    assert_not_eq!(pos, -1)
    println("pos: \{pos}")
    println("b[0]: \{b[0]}")
  } catch {
    error => {
      println("Error: \{error}")
      @c.exit(@c.exit_failure)
    }
  }
}
