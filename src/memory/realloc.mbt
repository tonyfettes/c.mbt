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
extern "c" fn memory_realloc(ptr : @c.Ptr[Unit], size : UInt64) -> @c.Ptr[Unit] = "moonbit_tonyfettes_c_memory_realloc"

///|
pub fn[T] realloc(ptr : @c.Ptr[T], size : UInt64) -> @c.Ptr[T] {
  memory_realloc(ptr.cast(), size).cast()
}
