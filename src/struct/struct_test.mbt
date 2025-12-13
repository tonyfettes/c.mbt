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
test "Reader" {
  let memory : @pointer.Pointer[Unit] = @memory.malloc(16)
  let writer = @struct.Writer::new(memory.cast())
  defer @memory.free(memory)
  writer.write(b'H')
  writer.write(1234)
  let reader = @struct.Reader::new(memory.cast())
  let byte : Byte = reader.read()
  let int : Int = reader.read()
  @json.inspect(byte, content=72)
  @json.inspect(int, content=1234)
}

///|
test "Layout" {
  let debug = @struct.Layout::new()
  let event : Field[Int] = debug.field()
  let name : Field[@pointer.Pointer[Byte]] = debug.field()
  let name_what : Field[@pointer.Pointer[Byte]] = debug.field()
  let what : Field[@pointer.Pointer[Byte]] = debug.field()
  let source : Field[@pointer.Pointer[Byte]] = debug.field()
  let srclen : Field[UInt64] = debug.field()
  let current_line : Field[Int] = debug.field()
  let line_defined : Field[Int] = debug.field()
  let last_line_defined : Field[Int] = debug.field()
  let n_ups : Field[Byte] = debug.field()
  @json.inspect(n_ups.offset(), content="60")
  let n_params : Field[Byte] = debug.field()
  @json.inspect(n_params.offset(), content="61")
  let is_var_arg : Field[Bool] = debug.field()
  let is_tail_call : Field[Bool] = debug.field()
  let f_transfer : Field[UInt16] = debug.field()
  let n_transfer : Field[UInt16] = debug.field()
  let short_src : ArrayField[Byte] = debug.array_field(60)
  let _ : Field[@pointer.Pointer[Unit]] = debug.field()
  @json.inspect(debug.size(), content="136")
  @json.inspect(debug.align(), content="8")
}
