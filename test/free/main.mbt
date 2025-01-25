///|
fn main {
  let p1 : @c.Ptr[Int] = @c.malloc(10UL * @c.sizeof(@c.int))
  @c.free(p1)
  let p2 : @c.Ptr[Int] = @c.calloc(10UL, @c.sizeof(@c.int))
  let p3 : @c.Ptr[Int] = @c.realloc(p2, 1000UL * @c.sizeof(@c.int))
  if not(p3.is_null()) {
    @c.free(p3)
  } else {
    @c.free(p2)
  }
}
