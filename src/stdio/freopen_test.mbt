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
test "freopen" {
  let path = b"freopen_test.txt"
  let file = @stdio.fopen(path, b"w")
  let redirect_path = b"freopen_redirect.txt"
  let _ = @stdio.freopen(redirect_path, b"w", file)
  let _ = @stdio.fputs(b"Hello, freopen!\n", file)
  @stdio.fflush(file)
  @stdio.fclose(file)
  let file = @stdio.fopen(path, b"r")
  let buf : FixedArray[Byte] = FixedArray::make(1024, 0)
  let n = @stdio.fread(buf, 1, 1024, file)
  @json.inspect(
    @encoding/utf8.decode(buf.unsafe_reinterpret_as_bytes()[0:n.to_int()]),
    content="",
  )
  let redirect_file = @stdio.fopen(redirect_path, b"r")
  let n = @stdio.fread(buf, 1, 1024, redirect_file)
  @json.inspect(
    @encoding/utf8.decode(buf.unsafe_reinterpret_as_bytes()[0:n.to_int()]),
    content="Hello, freopen!\n",
  )
  @stdio.fclose(file)
  @stdio.remove(path)
  @stdio.remove(redirect_path)
}

///|
test "freopen/non-existent" {
  let path = b"non_existent_freopen_test.txt"
  let result = try? @stdio.freopen(path, b"r", @stdio.stdin)
  @json.inspect(result is Err(_), content=true)
}
