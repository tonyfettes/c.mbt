///|
test "signal/sig-ign" {
  @json.inspect(
    @signal.signal(@signal.sigint, @signal.sig_ign) != @signal.sig_err,
    content=true,
  )
  @signal.raise_(@signal.sigint)
  ignore(@signal.signal(@signal.sigint, @signal.sig_dfl))
}

///|
let last_signal : Ref[Int] = Ref::new(0)

///|
test "signal" {
  @json.inspect(
    @signal.signal(
      @signal.sigint,
      @signal.handler(sig => last_signal.val = sig),
    ) !=
    @signal.sig_err,
    content=true,
  )
  @signal.raise_(@signal.sigint)
  ignore(@signal.signal(@signal.sigint, @signal.sig_dfl))
  @json.inspect(last_signal.val == @signal.sigint, content=true)
}

///|
test "signal/values" {
  @json.inspect(@signal.sigabrt > 0, content=true)
  @json.inspect(@signal.sigfpe > 0, content=true)
  @json.inspect(@signal.sigill > 0, content=true)
  @json.inspect(@signal.sigint > 0, content=true)
  @json.inspect(@signal.sigsegv > 0, content=true)
  @json.inspect(@signal.sigterm > 0, content=true)
}
