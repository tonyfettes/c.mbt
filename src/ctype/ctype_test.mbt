///|
test "ctype/is" {
  let table : FixedArray[Byte] = FixedArray::makei(128, i => i.to_byte())
  let results : Array[(FixedArray[Int], (Byte, Byte))] = []
  for byte in table {
    let value : FixedArray[Int] = [
      @ctype.iscntrl(byte).to_int(),
      @ctype.isprint(byte).to_int(),
      @ctype.isspace(byte).to_int(),
      @ctype.isgraph(byte).to_int(),
      @ctype.ispunct(byte).to_int(),
      @ctype.isalnum(byte).to_int(),
      @ctype.isalpha(byte).to_int(),
      @ctype.isupper(byte).to_int(),
      @ctype.islower(byte).to_int(),
      @ctype.isdigit(byte).to_int(),
      @ctype.isxdigit(byte).to_int(),
    ]
    if results.last() is Some(last) && last.0 == value {
      results[results.length() - 1] = (last.0, (last.1.0, byte))
    } else {
      results.push((value, (byte, byte)))
    }
  }
  @json.inspect(results, content=[
    [[1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], [0, 8]],
    [[1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0], [9, 13]],
    [[1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], [14, 31]],
    [[0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0], [32, 32]],
    [[0, 1, 0, 1, 1, 0, 0, 0, 0, 0, 0], [33, 47]],
    [[0, 1, 0, 1, 0, 1, 0, 0, 0, 1, 1], [48, 57]],
    [[0, 1, 0, 1, 1, 0, 0, 0, 0, 0, 0], [58, 64]],
    [[0, 1, 0, 1, 0, 1, 1, 1, 0, 0, 1], [65, 70]],
    [[0, 1, 0, 1, 0, 1, 1, 1, 0, 0, 0], [71, 90]],
    [[0, 1, 0, 1, 1, 0, 0, 0, 0, 0, 0], [91, 96]],
    [[0, 1, 0, 1, 0, 1, 1, 0, 1, 0, 1], [97, 102]],
    [[0, 1, 0, 1, 0, 1, 1, 0, 1, 0, 0], [103, 122]],
    [[0, 1, 0, 1, 1, 0, 0, 0, 0, 0, 0], [123, 126]],
    [[1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], [127, 127]],
  ])
}

///|
test "ctype/to" {
  let lower = b"abcdefghijklmnopqrstuvwxyz"
  let upper = b"ABCDEFGHIJKLMNOPQRSTUVWXYZ"
  for i, byte in lower {
    @json.inspect(@ctype.toupper(byte), content=upper[i].to_json())
  }
  for i, byte in upper {
    @json.inspect(@ctype.tolower(byte), content=lower[i].to_json())
  }
}
