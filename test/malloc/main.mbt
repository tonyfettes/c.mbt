///|
fn main {
  let p1 : @c.Ptr[Int] = @c.malloc(4UL * @c.sizeof(@c.int))
  let p2 : @c.Ptr[Int] = @c.malloc(@c.sizeof(@c.int[4]))
  if not(p1.is_null()) {
    for n in 0..<4 {
      p1[n] = n * n
    }
    for n in 0..<4 {
      println("p1[\{n}] == \{p1[n]}")
    }
  }
  @c.free(p1)
  @c.free(p2)
}
