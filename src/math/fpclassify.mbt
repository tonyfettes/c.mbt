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
extern "c" fn math_fp_normal() -> Int = "moonbit_tonyfettes_c_math_fp_normal"

///|
pub let fp_normal : Int = math_fp_normal()

///|
extern "c" fn math_fp_subnormal() -> Int = "moonbit_tonyfettes_c_math_fp_subnormal"

///|
pub let fp_subnormal : Int = math_fp_subnormal()

///|
extern "c" fn math_fp_zero() -> Int = "moonbit_tonyfettes_c_math_fp_zero"

///|
pub let fp_zero : Int = math_fp_zero()

///|
extern "c" fn math_fp_infinite() -> Int = "moonbit_tonyfettes_c_math_fp_infinite"

///|
pub let fp_infinite : Int = math_fp_infinite()

///|
extern "c" fn math_fp_nan() -> Int = "moonbit_tonyfettes_c_math_fp_nan"

///|
pub let fp_nan : Int = math_fp_nan()

///|
pub enum FpCategory {
  Normal
  Subnormal
  Zero
  Infinite
  Nan
  Unknown(Int)
} derive(ToJson)

///|
trait FpClassify {
  fpclassify(self : Self) -> FpCategory
}

///|
extern "c" fn math_fp_classify_float(value : Float) -> Int = "moonbit_tonyfettes_c_math_fp_classify_float"

///|
pub impl FpClassify for Float with fpclassify(self : Float) -> FpCategory {
  let category = math_fp_classify_float(self)
  if category == fp_normal {
    Normal
  } else if category == fp_subnormal {
    Subnormal
  } else if category == fp_zero {
    Zero
  } else if category == fp_infinite {
    Infinite
  } else if category == fp_nan {
    Nan
  } else {
    Unknown(category)
  }
}

///|
extern "c" fn math_fp_classify_double(value : Double) -> Int = "moonbit_tonyfettes_c_math_fp_classify_double"

///|
pub impl FpClassify for Double with fpclassify(self : Double) -> FpCategory {
  let category = math_fp_classify_double(self)
  if category == fp_normal {
    Normal
  } else if category == fp_subnormal {
    Subnormal
  } else if category == fp_zero {
    Zero
  } else if category == fp_infinite {
    Infinite
  } else if category == fp_nan {
    Nan
  } else {
    Unknown(category)
  }
}

///|
pub fn[T : FpClassify] fpclassify(value : T) -> FpCategory {
  value.fpclassify()
}

///|
extern "c" fn math_fp_is_finite_float(value : Float) -> Int = "moonbit_tonyfettes_c_math_fp_is_finite_float"

///|
extern "c" fn math_fp_is_finite_double(value : Double) -> Int = "moonbit_tonyfettes_c_math_fp_is_finite_double"

///|
extern "c" fn math_fp_is_inf_float(value : Float) -> Int = "moonbit_tonyfettes_c_math_fp_is_inf"

///|
extern "c" fn math_fp_is_inf_double(value : Double) -> Int = "moonbit_tonyfettes_c_math_fp_is_inf_double"

///|
trait IsInf {
  is_inf(self : Self) -> Bool
}

///|
pub impl IsInf for Float with is_inf(self : Float) -> Bool {
  math_fp_is_inf_float(self) != 0
}

///|
pub impl IsInf for Double with is_inf(self : Double) -> Bool {
  math_fp_is_inf_double(self) != 0
}

///|
pub fn[T : IsInf] is_inf(value : T) -> Bool {
  value.is_inf()
}

///|
trait IsFinite {
  is_finite(self : Self) -> Bool
}

///|
pub impl IsFinite for Float with is_finite(self : Float) -> Bool {
  math_fp_is_finite_float(self) != 0
}

///|
pub impl IsFinite for Double with is_finite(self : Double) -> Bool {
  math_fp_is_finite_double(self) != 0
}

///|
pub fn[T : IsFinite] is_finite(value : T) -> Bool {
  value.is_finite()
}

///|
extern "c" fn math_fp_is_nan_float(value : Float) -> Int = "moonbit_tonyfettes_c_math_fp_is_nan_float"

///|
extern "c" fn math_fp_is_nan_double(value : Double) -> Int = "moonbit_tonyfettes_c_math_fp_is_nan_double"

///|
trait IsNaN {
  is_nan(self : Self) -> Bool
}

///|
pub impl IsNaN for Float with is_nan(self : Float) -> Bool {
  math_fp_is_nan_float(self) != 0
}

///|
pub impl IsNaN for Double with is_nan(self : Double) -> Bool {
  math_fp_is_nan_double(self) != 0
}

///|
pub fn[T : IsNaN] is_nan(value : T) -> Bool {
  value.is_nan()
}
