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
test "fputs" {
  let path = b"fputs_test.txt"
  let file = @stdio.fopen(path, b"w")
  let text = b"Hello, world!"
  let _ = @stdio.fputs(text, file)
  let read : FixedArray[Byte] = FixedArray::make(text.length(), 0)
  @stdio.fflush(file)
  @stdio.fclose(file)
  let file = @stdio.fopen(path, b"r")
  let n = @stdio.fread(read, @sizeof.Byte, text.length().to_uint64(), file)
  json_inspect(
    @encoding/utf8.decode(read.unsafe_reinterpret_as_bytes()[0:n.to_int()]),
    content="Hello, world!",
  )
  @stdio.fclose(file)
  @stdio.remove(path)
}
