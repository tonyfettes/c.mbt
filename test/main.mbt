///|
#external
type Ptr[_]

///|
extern "c" fn pointer_null() -> Ptr[Unit] = "tonyfettes_c_test_pointer_null"

///|
fn[T, U] Ptr::cast(self : Ptr[T]) -> Ptr[U] = "%identity"

///|
fn[T] Ptr::to_array(self : Ptr[T]) -> FixedArray[T] = "%identity"

///|
fn[T] Ptr::of_array(self : FixedArray[T]) -> Ptr[T] = "%identity"

///|
fn[T] Ptr::to_ref(self : Ptr[T]) -> Ref[T] = "%identity"

///|
fn[T] Ptr::of_ref(self : Ref[T]) -> Ptr[T] = "%identity"

///|
fn[T] ref_add(_ : Ref[T], offset : UInt64) -> Ref[T] = "%u64.add"

///|
fn[T] array_add(array : FixedArray[T], offset : UInt64) -> FixedArray[T] = "%u64.add"

///|
fn[T] Ptr::offset_from(self : Ptr[T], from : Ptr[T]) -> UInt64 = "%u64.sub"

///|
fn[T] sizeof_ref(_ : (T) -> Unit) -> UInt64 {
  let ptr : Ptr[T] = pointer_null().cast()
  let ref_ = ref_add(ptr.to_ref(), 1)
  Ptr::of_ref(ref_).offset_from(ptr)
}

///|
pub fn[T] sizeof_array(_ : (T) -> Unit) -> UInt64 {
  let ptr : Ptr[T] = pointer_null().cast()
  let array = array_add(ptr.to_array(), 1)
  Ptr::of_array(array).offset_from(ptr)
}

///|
#valtype
struct IPv6(UInt64, UInt64)

///|
pub fn[T] alignof(_ : (T) -> Unit) -> UInt64 {
  struct A(T)
  let ptr : Ptr[T] = pointer_null().cast()
  let array = array_add(ptr.to_array(), 1)
  Ptr::of_array(array).offset_from(ptr)
}

///|
#valtype
struct IPv4(Byte, Byte, Byte, Byte)

#valtype
struct Four16(Int16, Int16, Int16, Int16)

///|
#valtype
struct FourBool(Bool, Bool, Bool, Bool)

///|
#valtype
struct Complexf(Float, Float)

///|
#valtype
struct Complex(Double, Double)

#valtype
enum FloatOrDouble {
  Float(Float)
}

///|
fn main {
  // sizeof-ref
  println("Ref[Bool]:   \{sizeof_ref((_ : Bool) => ())}")
  println("Ref[Byte]:   \{sizeof_ref((_ : Byte) => ())}")
  println("Ref[Int16]:  \{sizeof_ref((_ : Int16) => ())}")
  println("Ref[UInt16]: \{sizeof_ref((_ : UInt16) => ())}")
  println("Ref[Int]:    \{sizeof_ref((_ : Int) => ())}")
  println("Ref[UInt]:   \{sizeof_ref((_ : UInt) => ())}")
  println("Ref[Int64]:  \{sizeof_ref((_ : Int64) => ())}")
  println("Ref[UInt64]: \{sizeof_ref((_ : UInt64) => ())}")
  println("Ref[Float]:  \{sizeof_ref((_ : Float) => ())}")
  println("Ref[Double]: \{sizeof_ref((_ : Double) => ())}")
  println("Ref[IPv6]:   \{sizeof_ref((_ : IPv6) => ())}")

  // sizeof-array
  println("Bool:            \{sizeof_array((_ : Bool) => ())}")
  println("Byte:            \{sizeof_array((_ : Byte) => ())}")
  println("Int16:           \{sizeof_array((_ : Int16) => ())}")
  println("UInt16:          \{sizeof_array((_ : UInt16) => ())}")
  println("Int:             \{sizeof_array((_ : Int) => ())}")
  println("UInt:            \{sizeof_array((_ : UInt) => ())}")
  println("Char:            \{sizeof_array((_ : Char) => ())}")
  println("Int64:           \{sizeof_array((_ : Int64) => ())}")
  println("UInt64:          \{sizeof_array((_ : UInt64) => ())}")
  println("Float:           \{sizeof_array((_ : Float) => ())}")
  println("Double:          \{sizeof_array((_ : Double) => ())}")

  // Value types
  println("Bytes:           \{sizeof_array((_ : Bytes) => ())}")
  println("String:          \{sizeof_array((_ : String) => ())}")
  println("BytesView:       \{sizeof_array((_ : BytesView) => ())}")
  println("StringView:      \{sizeof_array((_ : StringView) => ())}")
  println(
    "ArrayView[Byte]: \{sizeof_array((ignore : (ArrayView[Byte]) -> Unit))}",
  )
  println("IPv6:            \{sizeof_array((_ : IPv6) => ())}")
  println("IPv4:            \{sizeof_array((_ : IPv4) => ())}")
  println("Error:           \{sizeof_array((_ : Error) => ())}")
  println("Complexf:        \{sizeof_array((_ : Complexf) => ())}")
  println("Complex:         \{sizeof_array((_ : Complex) => ())}")
  println("FourBool:        \{sizeof_array((_ : FourBool) => ())}")
  println("Four16:          \{sizeof_array((_ : Four16) => ())}")
  println("FloatOrDouble:   \{sizeof_array((_ : FloatOrDouble) => ())}")
}
