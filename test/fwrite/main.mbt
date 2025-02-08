///|
fn main {
  try {
    let a : FixedArray[Double] = [1, 2, 3, 4, 5]
    let a_mem = @memory.of_array(a)
    let f1_name = b"file.bin" |> @moonbit.bytes_to_ntbs()
    let f1_mode = b"wb" |> @moonbit.bytes_to_ntbs()
    let f1 = @c.fopen(f1_name, f1_mode)
    @c.free(f1_name)
    @c.free(f1_mode)
    assert_true!(not(f1.is_null()))
    let r1 = @c.fwrite()

  } catch {
    error => {
      println("Error: \{error}")
      @c.exit(@c.exit_failure)
    }
  }
}
