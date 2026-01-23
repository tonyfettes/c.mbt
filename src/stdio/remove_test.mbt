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
test "remove" {
  let file = @stdio.fopen(b"remove_test.txt", b"w")
  let _ = @stdio.fwrite(b"Test data", 1, 9, file)
  @stdio.fclose(file)
  @stdio.remove(b"remove_test.txt")
}

///|
test "remove/non-existent" {
  json_inspect(
    (try? @stdio.remove(b"non_existent_file.txt")) is Err(_),
    content=true,
  )
}
