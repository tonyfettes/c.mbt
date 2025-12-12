// Copyright 2025 International Digital Economy Academy
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

///|
test "fwrite[Bytes]" {
  let path = b"fwrite.txt"
  let file = @stdio.fopen(path, b"w")
  let n = @stdio.fwrite(b"Hello, world!", 13, file)
  @json.inspect(n, content="13")
  @json.inspect(@stdio.feof(file), content=false)
  @json.inspect(@stdio.ferror(file), content=false)
  @stdio.fclose(file)
  @stdio.remove(path)
}

///|
test "fwrite[FixedArray]" {
  let path = b"fwrite.txt"
  let file = @stdio.fopen(path, b"w")
  let buf = b"Hello, world!".to_fixedarray()
  let n = @stdio.fwrite(buf, buf.length().to_uint64(), file)
  @json.inspect(n, content="13")
  @json.inspect(@stdio.feof(file), content=false)
  @json.inspect(@stdio.ferror(file), content=false)
  @stdio.fclose(file)
  @stdio.remove(path)
}

///|
test "fwrite[@c.Pointer]" {
  let path = b"fwrite.txt"
  let file = @stdio.fopen(path, b"w")
  let buf = b"Hello, world!"
  let ptr : @c.Ptr[Byte] = @memory.malloc(13)
  defer @memory.free(ptr)
  for i in 0..<buf.length() {
    ptr[i.to_uint64()] = buf[i]
  }
  let n = @stdio.fwrite(ptr, 13, file)
  @json.inspect(n, content="13")
  @json.inspect(@stdio.feof(file), content=false)
  @json.inspect(@stdio.ferror(file), content=false)
  @stdio.fclose(file)
  @stdio.remove(path)
}
