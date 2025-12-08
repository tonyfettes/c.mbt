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
#external
#deprecated("Nullable[T] can leak memory if T is a managed type. Define a null value for type `T` yourself instead.", skip_current_package=true)
pub type Nullable[_]

///|
fn[T] Nullable::_some(value : T) -> Nullable[T] = "%identity"

///|
pub fn[T] Nullable::some(value : T) -> Nullable[T] {
  Nullable::_some(value).cast()
}

///|
fn[T] Nullable::_unwrap(self : Nullable[T]) -> T = "%identity"

///|
fn[T] Nullable::unwrap(self : Nullable[T]) -> T {
  self.cast()._unwrap()
}

///|
extern "c" fn Nullable::_none() -> Nullable[Unit] = "moonbit_c_null"

///|
fn[T, U] Nullable::_type_cast(self : Nullable[T]) -> Nullable[U] = "%identity"

///|
extern "c" fn Nullable::_impl_cast(self : Nullable[Unit]) -> Nullable[Unit] = "moonbit_c_identity"

///|
fn[T, U] Nullable::cast(self : Nullable[T]) -> Nullable[U] {
  self._type_cast()._impl_cast()._type_cast()
}

///|
pub fn[T] Nullable::none() -> Nullable[T] {
  Nullable::_none().cast()
}

///|
pub fn[T] none() -> Nullable[T] {
  Nullable::_none().cast()
}

///|
extern "c" fn Nullable::_is_null(self : Nullable[Unit]) -> Bool = "moonbit_c_is_null"

///|
pub fn[T] Nullable::is_null(self : Nullable[T]) -> Bool {
  self.cast()._is_null()
}

///|
pub fn[T] Nullable::of(option : T?) -> Nullable[T] {
  match option {
    Some(value) => Nullable::some(value)
    None => Nullable::none()
  }
}

///|
pub fn[T] Nullable::to(self : Nullable[T]) -> T? {
  if self.is_null() {
    return None
  } else {
    return Some(self.unwrap())
  }
}

///|
pub(open) trait IsNullable {
  null() -> Self
  is_null(self : Self) -> Bool
}

///|
#external
pub type Null

///|
extern "c" fn c_null() -> Null = "moonbit_tonyfettes_c_pointer_null"

///|
pub let null : Null = c_null()
