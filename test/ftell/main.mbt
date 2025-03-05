///|
fn main {
  try {
    // Prepare an array of FP values. */
    let a : FixedArray[Double] = [1.1, 2.0, 3.0, 4.0, 5.0]
    let a_ptr = a |> @c.Pointer::of_array()

    // Write array to a file. */
    let fname = b"test.bin"
    let file = @c.fopen(fname, b"wb")
    guard file is Some(file)
    let write_count = @c.fwrite(
      a_ptr.cast(),
      @c.sizeof(@c.double),
      a.length(),
      file,
    )
    println("write_count: \{write_count}")
    assert_eq!(write_count, a.length().to_uint64())
    @c.fflush(file) |> ignore()
    @c.fclose(file) |> ignore()

    // Read the FP values into array B. */
    let b : @c.Pointer[Double] = @c.calloc(a.length())
    let file = @c.fopen(fname, b"rb")
    guard file is Some(file)
    let pos = @c.ftell(file)
    assert_not_eq!(pos, -1)
    let read_count = @c.fread(b.cast(), @c.sizeof(@c.double), 1, file)
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
