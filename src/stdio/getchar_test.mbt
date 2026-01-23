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
test "getchar" {
  let c = @stdio.getchar()
  json_inspect(c, content=@stdio.eof.to_json())
  let file = @stdio.fopen(b"getchar_test.txt", b"w")
  let _ = @stdio.fwrite(b"A", 1, 1, file)
  @stdio.fclose(file)
  let _ = @stdio.freopen(b"getchar_test.txt", b"r", @stdio.stdin)
  let c = @stdio.getchar()
  json_inspect(c, content=65)
  @stdio.remove(b"getchar_test.txt")
}
