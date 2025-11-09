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
extern "c" fn c_EOF() -> Int = "moonbit_tonyfettes_c_stdio_EOF"

///|
pub let eof : Int = c_EOF()

///|
extern "c" fn c_stdin() -> FILE = "moonbit_tonyfettes_c_stdio_stdin"

///|
pub let stdin : FILE = c_stdin()

///|
extern "c" fn c_stdout() -> FILE = "moonbit_tonyfettes_c_stdio_stdout"

///|
pub let stdout : FILE = c_stdout()

///|
extern "c" fn c_stderr() -> FILE = "moonbit_tonyfettes_c_stdio_stderr"

///|
pub let stderr : FILE = c_stderr()
