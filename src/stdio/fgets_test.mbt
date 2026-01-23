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
test "fgets" {
  let file = @stdio.fopen(b"fgets_text.txt", b"w")
  let _ = @stdio.fputs(b"Hello, Moonbit!\nHello, World!\n", file)
  @stdio.fclose(file)
  let file = @stdio.fopen(b"fgets_text.txt", b"r")
  let buf : FixedArray[Byte] = FixedArray::make(64, 0)
  json_inspect(@stdio.fgets(buf, 64, file) is Some(_), content=true)
  let buf = buf.unsafe_reinterpret_as_bytes()
  json_inspect(buf is [.. "Hello, Moonbit!\n", ..], content=true)
  @stdio.fclose(file)
  @stdio.remove(b"fgets_text.txt")
}

///|
test "fgets/eof" {
  let file = @stdio.fopen(b"fgets_eof.txt", b"w")
  let _ = @stdio.fputs(b"EOF", file)
  @stdio.fclose(file)
  let file = @stdio.fopen(b"fgets_eof.txt", b"r")
  let buf : FixedArray[Byte] = FixedArray::make(16, 0)
  json_inspect(@stdio.fgets(buf, 16, file) is Some(_), content=true)
  json_inspect(@stdio.fgets(buf, 16, file) is None, content=true)
  @stdio.fclose(file)
  @stdio.remove(b"fgets_eof.txt")
}
