///|
extern "c" fn thrd_create(
  thread : @c.Pointer[Thrd],
  func : FuncRef[(@c.Pointer[Unit]) -> Int],
  data : @c.Pointer[Unit],
) -> Int = "moonbit_tonyfettes_c_thrd_create"

///|
fn[T, U] FuncRef::cast(self : FuncRef[T]) -> FuncRef[U] = "%identity"

///|
pub fn[T] create(
  thread : @c.Pointer[Thrd],
  func : FuncRef[(@c.Pointer[T]) -> Int],
  data : @c.Pointer[T],
) -> Int {
  thrd_create(thread, func.cast(), data.cast())
}
