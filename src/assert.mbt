///|
pub fn assert(condition : Bool, loc~ : SourceLoc = _) -> Unit {
  if not(condition) {
    println("FAILED: \{loc} `\{condition}` is not true")
    panic()
  }
}
