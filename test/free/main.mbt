///|
fn main {
  let p1 : @c.Pointer[Int] = @c.calloc(10)
  @c.free(p1)
  let p2 : @c.Pointer[Int] = @c.calloc(10)
  let p3 : @c.Pointer[Int] = @c.realloc(p2.cast(), 1000)
  if not(p3.is_null()) {
    @c.free(p3)
  } else {
    @c.free(p2)
  }
}
