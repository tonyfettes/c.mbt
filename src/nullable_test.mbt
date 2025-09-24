///|
test "Nullable/bytes" {
  let bytes = Bytes::makei(4, i => i.to_byte())
  ignore(@c.Nullable::some(bytes))
}

///|
priv type Data

///|
extern "c" fn Data::malloc(size : UInt64) -> @c.Nullable[Data] = "malloc"

///|
test "Nullable/extern-object" {
  let data = Data::malloc(16)
  ignore(data.to())
}
