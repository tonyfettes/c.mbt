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
test "fread[FixedArray[_]]" {
  let file = @stdio.fopen(b"moon.mod.json", b"r")
  let buf : FixedArray[Byte] = FixedArray::make(1024, 0)
  let n = @stdio.fread(buf, 1, 1024, file)
  @json.inspect(n, content=438)
  @json.inspect(@stdio.feof(file), content=true)
  @json.inspect(@stdio.ferror(file), content=false)
  @stdio.fclose(file)
}

///|
test "fread[@c.Pointer[_]]" {
  let file = @stdio.fopen(b"moon.mod.json", b"r")
  let buf : @pointer.Pointer[Byte] = @memory.malloc(1024)
  defer @memory.free(buf)
  let n = @stdio.fread(buf, 1, 1024, file)
  @json.inspect(n, content=438)
  @json.inspect(@stdio.feof(file), content=true)
  @json.inspect(@stdio.ferror(file), content=false)
  @stdio.fclose(file)
}
