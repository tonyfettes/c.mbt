// fn main {
//   try {
//     // Prepare an array of FP values. */
//     let a : FixedArray[Double] = [1.1, 2.0, 3.0, 4.0, 5.0]

//     // Write array to a file. */
//     let fname = b"/tmp/test.bin" |> @moonbit.bytes_to_ntbs()
//     let mode = b"wb" |> @moonbit.bytes_to_ntbs()
//     let file = @c.fopen(fname, mode);
//     @c.free(fname)
//     @c.free(mode)
//     assert_true!(not(file.is_null()))

//     let write_count = @c.fwrite(a, @c.sizeof(@c.double), a.length(), file);
//     check(write_count == SIZE, "fwrite()", __LINE__);

//     fclose(file);

//     // Read the FP values into array B. */
//     double B[SIZE];
//     file = @c.fopen(fname, mode);
//     check(file != NULL, "fopen()", __LINE__);

//     long int pos = ftell(file); // position indicator at start of file */
//     check(pos != -1L, "ftell()", __LINE__);
//     printf("pos: %ld\n", pos);

//     const int read_count = fread(B, sizeof(double), 1, file); // read one FP value */
//     check(read_count == 1, "fread()", __LINE__);

//     pos = ftell(file); // position indicator after reading one FP value */
//     check(pos != -1L, "ftell()", __LINE__);
//     printf("pos: %ld\n", pos);
//     printf("B[0]: %.1f\n", B[0]); // print one FP value */

//     return EXIT_SUCCESS;
//   } catch {
//     _ => @c.exit(@c.exit_failure);
//   }
// }
