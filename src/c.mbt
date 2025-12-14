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
pub using @exit {exit, atexit}

///|
pub let exit_success : Int = @exit.success

///|
pub let exit_failure : Int = @exit.failure

///|
pub using @memory {malloc, free, realloc, calloc, memcpy, memset}

///|
pub type Ptr[T] = Pointer[T]

///|
pub using @pointer {
  type Pointer,
  null,
  borrow,
  borrow_bytes,
  borrow_array,
  borrow_ref,
}

///|
pub using @stdlib {getenv, system}

///|
pub using @string {strlen, strcmp}

///|
pub using @stddef {type Size, type Ptrdiff}
