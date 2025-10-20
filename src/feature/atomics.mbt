///|
extern "c" fn feature_no_atomics() -> Int = "moonbit_tonyfettes_c_feature_no_atomics"

///|
pub let no_atomics : Bool = feature_no_atomics() != 0
