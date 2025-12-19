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
struct Time(UInt64)

///|
pub extern "c" fn time() -> Time = "moonbit_tonyfettes_c_time"

///|
pub extern "c" fn difftime(time_end : Time, time_beg : Time) -> Double = "moonbit_tonyfettes_c_difftime"

///|
#external
type Tm

///|
pub extern "c" fn localtime(time : Time) -> Tm = "moonbit_tonyfettes_c_localtime"

///|
pub extern "c" fn gmtime(time : Time) -> Tm = "moonbit_tonyfettes_c_gmtime"

///|
pub extern "c" fn Tm::sec(self : Tm) -> Int = "moonbit_tonyfettes_c_tm_sec"

///|
pub extern "c" fn Tm::min(self : Tm) -> Int = "moonbit_tonyfettes_c_tm_min"

///|
pub extern "c" fn Tm::hour(self : Tm) -> Int = "moonbit_tonyfettes_c_tm_hour"

///|
pub extern "c" fn Tm::mday(self : Tm) -> Int = "moonbit_tonyfettes_c_tm_mday"

///|
pub extern "c" fn Tm::mon(self : Tm) -> Int = "moonbit_tonyfettes_c_tm_mon"

///|
pub extern "c" fn Tm::year(self : Tm) -> Int = "moonbit_tonyfettes_c_tm_year"

///|
pub extern "c" fn Tm::wday(self : Tm) -> Int = "moonbit_tonyfettes_c_tm_wday"

///|
pub extern "c" fn Tm::yday(self : Tm) -> Int = "moonbit_tonyfettes_c_tm_yday"

///|
pub extern "c" fn Tm::isdst(self : Tm) -> Int = "moonbit_tonyfettes_c_tm_isdst"

///|
pub extern "c" fn mktime(tm : Tm) -> Time = "moonbit_tonyfettes_c_mktime"

///|
extern "c" fn c_strftime(
  str : @pointer.Pointer[Byte],
  len : Int,
  format : @pointer.Pointer[Byte],
  tm : Tm,
) -> UInt64 = "moonbit_tonyfettes_c_strftime"

///|
pub fn[T : @string.Borrow, F : @string.Borrow] strftime(
  str : T,
  len : Int,
  format : F,
  tm : Tm,
) -> UInt64 {
  @string.borrow_2(str, format, (str_ptr, format) => c_strftime(
    str_ptr, len, format, tm,
  ))
}

///|
struct Clock(UInt64)

///|
pub extern "c" fn clock() -> Clock = "moonbit_tonyfettes_c_clock"

///|
extern "c" fn c_clocks_per_sec() -> UInt64 = "moonbit_tonyfettes_c_clocks_per_sec"

///|
let clocks_per_sec : UInt64 = c_clocks_per_sec()

///|
pub fn Clock::to_seconds(self : Clock) -> Double {
  return self.0.to_double() / clocks_per_sec.to_double()
}
