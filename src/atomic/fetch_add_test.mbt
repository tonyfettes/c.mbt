///|
test "fetch_add" {
  let object : @c.Pointer[@atomic.Atomic[Int]] = @memory.calloc(1)
  @atomic.init_(object, 0)
  @json.inspect(@atomic.fetch_add(object, 1), content=0)
  @json.inspect(@atomic.load(object), content=1)
}

///|
test "fetch_add/concurrent" {
  if !@feature.no_threads {
    let counter : @c.Pointer[Int] = @memory.calloc(1)
    counter.store(0)
    let n_threads : UInt64 = 10
    let threads : @c.Pointer[@thrd.Thrd] = @memory.calloc(n_threads)
    for i in 0UL..<n_threads {
      @thrd.create(
        threads.add(i),
        (counter : @c.Pointer[Int]) => {
          for _ in 0..<1000 {
            counter.store(counter.load() + 1)
          }
          0
        },
        counter,
      )
      |> ignore()
    }
    for i in 0UL..<n_threads {
      @thrd.join(threads.add(i), @c.Pointer::null()) |> ignore()
    }
    @json.inspect(counter.load() < 10000, content=true)
    let atomic_counter : @c.Pointer[@atomic.Atomic[Int]] = @memory.calloc(1)
    @atomic.init_(atomic_counter, 0)
    for i in 0UL..<n_threads {
      @thrd.create(
        threads.add(i),
        (atomic_counter : @c.Pointer[@atomic.Atomic[Int]]) => {
          for _ in 0..<1000 {
            @atomic.fetch_add(atomic_counter, 1) |> ignore()
          }
          0
        },
        atomic_counter,
      )
      |> ignore()
    }
    for i in 0UL..<n_threads {
      @thrd.join(threads.add(i), @c.Pointer::null()) |> ignore()
    }
    @json.inspect(@atomic.load(atomic_counter), content=10000)
  }
}
