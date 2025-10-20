///|
let supports_atomics : Bool = !@feature.no_atomics &&
  @feature.version >= 201112L
