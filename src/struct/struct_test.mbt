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
  let writer = @struct.Writer::new(memory)
  defer @memory.free(memory)
  writer.write(b'H')
  writer.write(1234)
  let reader = @struct.Reader::new(memory)
  let byte : Byte = reader.read()
  let int : Int = reader.read()
  @json.inspect(byte, content=72)
  @json.inspect(int, content=1234)
}

///|
/// struct lua_Debug {
///   int event;
///   const char *name;	/* (n) */
///   const char *namewhat;	/* (n) 'global', 'local', 'field', 'method' */
///   const char *what;	/* (S) 'Lua', 'C', 'main', 'tail' */
///   const char *source;	/* (S) */
///   size_t srclen;	/* (S) */
///   int currentline;	/* (l) */
///   int linedefined;	/* (S) */
///   int lastlinedefined;	/* (S) */
///   unsigned char nups;	/* (u) number of upvalues */
///   unsigned char nparams;/* (u) number of parameters */
///   char isvararg;        /* (u) */
///   char istailcall;	/* (t) */
///   unsigned short ftransfer;   /* (r) index of first value transferred */
///   unsigned short ntransfer;   /* (r) number of transferred values */
///   char short_src[LUA_IDSIZE]; /* (S) */
///   /* private part */
///   struct CallInfo *i_ci;  /* active function */
/// };
test "Layout" {
  struct Debug {
    event : Field[Int]
    name : Field[@pointer.Pointer[Byte]]
    name_what : Field[@pointer.Pointer[Byte]]
    what : Field[@pointer.Pointer[Byte]]
    source : Field[@pointer.Pointer[Byte]]
    src_len : Field[@stddef.Size]
    current_line : Field[Int]
    line_defined : Field[Int]
    last_line_defined : Field[Int]
    n_ups : Field[Byte]
    n_params : Field[Byte]
    is_var_arg : Field[Bool]
    is_tail_call : Field[Bool]
    f_transfer : Field[UInt16]
    n_transfer : Field[UInt16]
    short_src : Field[Flatten[Byte]]
    i_ci : Field[@pointer.Pointer[Unit]]
  }
  let layout = @struct.Layout::new()
  let debug = Debug::{
    event: layout.field(),
    name: layout.field(),
    name_what: layout.field(),
    what: layout.field(),
    source: layout.field(),
    src_len: layout.field(),
    current_line: layout.field(),
    line_defined: layout.field(),
    last_line_defined: layout.field(),
    n_ups: layout.field(),
    n_params: layout.field(),
    is_var_arg: layout.field(),
    is_tail_call: layout.field(),
    f_transfer: layout.field(),
    n_transfer: layout.field(),
    short_src: layout.array_field(60),
    i_ci: layout.field(),
  }
  @json.inspect(debug.event.offset(), content=0)
  @json.inspect(debug.name.offset(), content=4)
  @json.inspect(debug.name_what.offset(), content=16)
  @json.inspect(debug.what.offset(), content=24)
  @json.inspect(debug.source.offset(), content=32)
  @json.inspect(debug.src_len.offset(), content=40)
  @json.inspect(debug.current_line.offset(), content=48)
  @json.inspect(debug.line_defined.offset(), content=52)
  @json.inspect(debug.last_line_defined.offset(), content=56)
  @json.inspect(debug.n_ups.offset(), content=60)
  @json.inspect(debug.n_params.offset(), content=61)
  @json.inspect(debug.is_var_arg.offset(), content=62)
  @json.inspect(debug.is_tail_call.offset(), content=63)
  @json.inspect(debug.f_transfer.offset(), content=64)
  @json.inspect(debug.n_transfer.offset(), content=66)
  @json.inspect(debug.short_src.offset(), content=68)
  @json.inspect(debug.i_ci.offset(), content=128)
  @json.inspect(layout.size(), content=136)
  @json.inspect(layout.alignment(), content=8)
  let object : @struct.Struct = @memory.calloc(1, layout.size())
  defer @memory.free(object.pointer())
  object[debug.event] = 42
  object[debug.current_line] = 2025
  object[debug.short_src][0] = b'L'
  object[debug.short_src][1] = b'U'
  object[debug.short_src][2] = b'A'
  @json.inspect(object[debug.event], content=42)
  @json.inspect(object[debug.current_line], content=2025)
  @json.inspect(object[debug.short_src][0], content=76)
  @json.inspect(object[debug.short_src][1], content=85)
  @json.inspect(object[debug.short_src][2], content=65)
  let dump : FixedArray[Byte] = FixedArray::make(layout.size().to_int(), 0)
  @pointer.borrow_array(dump, dump => @memory.memcpy(
    dump,
    object.pointer(),
    layout.size(),
  ))
  @json.inspect(dump.iterator(), content=[
    42, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 233, 7, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 76, 85, 65, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0,
  ])
}
