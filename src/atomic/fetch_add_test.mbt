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
test "fetch_add" {
  if !supports_atomics {
    return
  }
  let object : @atomic.Atomic[Int] = @memory.calloc(
    1,
    @atomic.sizeof((_ : Int) => ()),
  )
  defer @memory.free(object.to_pointer())
  @atomic.init_(object, 0)
  json_inspect(@atomic.fetch_add(object, 1), content=0)
  json_inspect(@atomic.load(object), content=1)
}

///|
const NThreads = 10

///|
const NIncrementsPerThread = 1000

///|
test "fetch_add/concurrent" {
  if !supports_atomics {
    return
  }
  if !@feature.no_threads {
    let counter : @pointer.Pointer[Int] = @memory.calloc(1, @sizeof.Int)
    defer @memory.free(counter)
    counter.store(0)
    let threads : @pointer.Pointer[@thrd.Thrd] = @memory.calloc(
      NThreads.to_uint64(),
      @thrd.Thrd::sizeof(),
    )
    defer @memory.free(threads)
    for i in 0..<NThreads {
      @thrd.create(
        threads.offset(i.to_int64()),
        counter => {
          for _ in 0..<NIncrementsPerThread {
            counter.store(counter.load() + 1)
          }
          0
        },
        counter,
      )
      |> ignore()
    }
    for i in 0..<NThreads {
      @thrd.join(threads.offset(i.to_int64()), @pointer.Pointer::null())
      |> ignore()
    }
    println(counter.load())
    json_inspect(
      counter.load() < NThreads * NIncrementsPerThread,
      content=true,
    )
    let atomic_counter : @atomic.Atomic[Int] = @memory.calloc(
      1,
      @atomic.sizeof((_ : Int) => ()),
    )
    defer @memory.free(atomic_counter.to_pointer())
    @atomic.init_(atomic_counter, 0)
    for i in 0..<NThreads {
      @thrd.create(
        threads.offset(i.to_int64()),
        atomic_counter => {
          for _ in 0..<NIncrementsPerThread {
            @atomic.fetch_add(atomic_counter, 1) |> ignore()
          }
          0
        },
        atomic_counter.0,
      )
      |> ignore()
    }
    for i in 0..<NThreads {
      @thrd.join(threads.offset(i.to_int64()), @pointer.Pointer::null())
      |> ignore()
    }
    json_inspect(@atomic.load(atomic_counter), content=10000)
  }
}
