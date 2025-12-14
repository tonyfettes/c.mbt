///|
type Zero

///|
type Succ[T]

///|
pub type Add1[T] = Succ[T]

///|
pub type Add2[T] = Succ[Succ[T]]

///|
pub type Add4[T] = Add2[Add2[T]]

///|
pub type Add8[T] = Add4[Add4[T]]

///|
pub type Add16[T] = Add8[Add8[T]]

///|
pub type Add32[T] = Add16[Add16[T]]

///|
pub type Add64[T] = Add32[Add32[T]]

///|
pub type Add128[T] = Add64[Add64[T]]

///|
pub type Add10[T] = Add8[Add2[T]]

///|
pub type Add20[T] = Add10[Add10[T]]

///|
pub type Add30[T] = Add10[Add20[T]]

///|
pub type Add40[T] = Add10[Add30[T]]

///|
pub type Add50[T] = Add10[Add40[T]]

///|
pub type Add60[T] = Add10[Add50[T]]

///|
pub type Add70[T] = Add10[Add60[T]]

///|
pub type Add80[T] = Add10[Add70[T]]

///|
pub type Add90[T] = Add10[Add80[T]]

///|
pub type Add100[T] = Add10[Add90[T]]

///|
pub type Nat0 = Zero

///|
pub type Nat1 = Succ[Nat0]

///|
pub type Nat2 = Succ[Nat1]

///|
pub type Nat3 = Succ[Nat2]

///|
pub type Nat4 = Succ[Nat3]

///|
pub type Nat5 = Succ[Nat4]

///|
pub type Nat6 = Succ[Nat5]

///|
pub type Nat7 = Succ[Nat6]

///|
pub type Nat8 = Succ[Nat7]

///|
pub type Nat9 = Succ[Nat8]
