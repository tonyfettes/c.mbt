///|
extern "c" fn feature_no_threads() -> Int = "moonbit_tonyfettes_c_feature_no_threads"

///|
pub let no_threads : Bool = feature_no_threads() != 0
