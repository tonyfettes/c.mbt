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
/// struct sockaddr {
///   __uint8_t       sa_len;         /* total length */
///   sa_family_t     sa_family;      /* [XSI] address family */
///   char            sa_data[14];    /* [XSI] addr value */
/// };
priv type Sockaddr

///|
let sa_len : Field[Sockaddr, Byte] = @struct.field()

///|
let sa_family : Field[Sockaddr, Byte] = sa_len.next()

///|
let sa_data : Field[Sockaddr, @array.Static[Byte, @nat.Od14[@nat.Z]]] = sa_family.next()

///|
impl @sizeof.Sized for Sockaddr with size() -> @stddef.Size {
  sa_data.next_offset()
}

///|
impl @alignof.Aligned for Sockaddr with alignment() -> @stddef.Size {
  let sa_end : Field[Sockaddr, Byte] = sa_data.next()
  sa_end.alignment()
}

///|
test "Sockaddr" {
  @json.inspect(sa_len.offset(), content=0)
  @json.inspect(sa_family.offset(), content=1)
  @json.inspect(sa_data.offset(), content=2)
  @json.inspect(Sockaddr::size(), content=16)
  @json.inspect(Sockaddr::alignment(), content=1)
}

///|
/// struct addrinfo {
///    int ai_flags;           /* input flags */
///    int ai_family;          /* protocol family for socket */
///    int ai_socktype;        /* socket type */
///    int ai_protocol;        /* protocol for socket */
///    socklen_t ai_addrlen;   /* length of socket-address */
///    char *ai_canonname;     /* canonical name for service location */
///    struct sockaddr ai_addr;  /* socket-address for socket,
///                                 modified to test inline struct */
///    struct addrinfo *ai_next; /* pointer to next in list */
/// };
priv type AddrInfo

///|
let ai_flags : Field[AddrInfo, Int] = @struct.field()

///|
let ai_family : Field[AddrInfo, Int] = ai_flags.next()

///|
let ai_socktype : Field[AddrInfo, Int] = ai_family.next()

///|
let ai_protocol : Field[AddrInfo, Int] = ai_socktype.next()

///|
let ai_addrlen : Field[AddrInfo, UInt] = ai_protocol.next()

///|
let ai_canonname : Field[AddrInfo, @pointer.Pointer[Byte]] = ai_addrlen.next()

///|
let ai_addr : Field[AddrInfo, @struct.Struct[Sockaddr]] = ai_canonname.next_struct()

///|
let ai_next : Field[AddrInfo, @pointer.Pointer[@struct.Struct[AddrInfo]]] = ai_addr.next()

///|
impl @sizeof.Sized for AddrInfo with size() -> @stddef.Size {
  ai_next.next_offset()
}

///|
impl @alignof.Aligned for AddrInfo with alignment() -> @stddef.Size {
  let ai_end : Field[AddrInfo, Byte] = ai_next.next()
  ai_end.alignment()
}

///|
test "addrinfo" {
  @json.inspect(ai_flags.offset(), content=0)
  @json.inspect(ai_family.offset(), content=4)
  @json.inspect(ai_socktype.offset(), content=8)
  @json.inspect(ai_protocol.offset(), content=12)
  @json.inspect(ai_addrlen.offset(), content=16)
  @json.inspect(ai_canonname.offset(), content=24)
  @json.inspect(ai_addr.offset(), content=32)
  @json.inspect(ai_next.offset(), content=48)
  @json.inspect(AddrInfo::size(), content=56)
  @json.inspect(AddrInfo::alignment(), content=8)
  let object : @struct.Struct[AddrInfo] = @memory.calloc(1, AddrInfo::size())
  defer @memory.free(object.pointer())
  object[ai_flags] = 123
  object[ai_family] = 456
  object[ai_socktype] = 789
  object[ai_protocol] = 1011
  object[ai_addrlen] = 1213
  object[ai_canonname] = @pointer.null()
  object[ai_addr][sa_family] = 14
  object[ai_next] = @pointer.null()
  @json.inspect(object[ai_flags], content=123)
  @json.inspect(object[ai_family], content=456)
}

///|
/// struct lua_Debug {
///   int event;
///   const char *name;  /* (n) */
///   const char *namewhat;  /* (n) 'global', 'local', 'field', 'method' */
///   const char *what;  /* (S) 'Lua', 'C', 'main', 'tail' */
///   const char *source;  /* (S) */
///   size_t srclen;  /* (S) */
///   int currentline;  /* (l) */
///   int linedefined;  /* (S) */
///   int lastlinedefined;  /* (S) */
///   unsigned char nups;  /* (u) number of upvalues */
///   unsigned char nparams;/* (u) number of parameters */
///   char isvararg;        /* (u) */
///   char istailcall;  /* (t) */
///   unsigned short ftransfer;   /* (r) index of first value transferred */
///   unsigned short ntransfer;   /* (r) number of transferred values */
///   char short_src[LUA_IDSIZE]; /* (S) */
///   /* private part */
///   struct CallInfo *i_ci;  /* active function */
/// };
priv type Debug

///|
priv struct DebugLayout {
  event : Field[Debug, Int]
  name : Field[Debug, @pointer.Pointer[Byte]]
  name_what : Field[Debug, @pointer.Pointer[Byte]]
  what : Field[Debug, @pointer.Pointer[Byte]]
  source : Field[Debug, @pointer.Pointer[Byte]]
  src_len : Field[Debug, @stddef.Size]
  current_line : Field[Debug, Int]
  line_defined : Field[Debug, Int]
  last_line_defined : Field[Debug, Int]
  n_ups : Field[Debug, Byte]
  n_params : Field[Debug, Byte]
  is_var_arg : Field[Debug, Bool]
  is_tail_call : Field[Debug, Bool]
  f_transfer : Field[Debug, UInt16]
  n_transfer : Field[Debug, UInt16]
  short_src : Field[Debug, @array.Dynamic[Byte]]
  i_ci : Field[Debug, @pointer.Pointer[Unit]]
  size : @stddef.Size
  alignment : @stddef.Size
}

///|
let debug : DebugLayout = {
  let builder = @struct.Builder::new()
  DebugLayout::{
    event: builder.field(),
    name: builder.field(),
    name_what: builder.field(),
    what: builder.field(),
    source: builder.field(),
    src_len: builder.field(),
    current_line: builder.field(),
    line_defined: builder.field(),
    last_line_defined: builder.field(),
    n_ups: builder.field(),
    n_params: builder.field(),
    is_var_arg: builder.field(),
    is_tail_call: builder.field(),
    f_transfer: builder.field(),
    n_transfer: builder.field(),
    short_src: builder.array_field(60),
    i_ci: builder.field(),
    size: builder.size(),
    alignment: builder.alignment(),
  }
}

///|
test "Layout" {
  @json.inspect(debug.event.offset(), content=0)
  @json.inspect(debug.name.offset(), content=8)
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
  @json.inspect(debug.size, content=136)
  @json.inspect(debug.alignment, content=8)
  let object : @struct.Struct[Debug] = @memory.calloc(1, debug.size)
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
  let dump : FixedArray[Byte] = FixedArray::make(debug.size.to_int(), 0)
  @pointer.borrow_array(dump, dump => @memory.memcpy(
    dump,
    object.pointer(),
    debug.size,
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
