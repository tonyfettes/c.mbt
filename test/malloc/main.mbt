///|
fn main {
  let p1 : @c.Ptr[Int] = @c.calloc(4)
  if not(p1.is_null()) {
    for n in 0..<4 {
      p1[n] = n * n
    }
    for n in 0..<4 {
      println("p1[\{n}] == \{p1[n]}")
    }
  }
  @c.free(p1)
}
