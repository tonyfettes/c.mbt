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
  let object : @c.Pointer[@atomic.Atomic[Int]] = @memory.calloc(1)
  defer @memory.free(object)
  @atomic.init_(object, 0)
  @json.inspect(@atomic.fetch_add(object, 1), content=0)
  @json.inspect(@atomic.load(object), content=1)
}

///|
test "fetch_add/concurrent" {
  if !supports_atomics {
    return
  }
  if !@feature.no_threads {
    let counter : @c.Pointer[Int] = @memory.calloc(1)
    defer @memory.free(counter)
    counter.store(0)
    let n_threads : UInt64 = 10
    let threads : @c.Pointer[@thrd.Thrd] = @memory.calloc(n_threads)
    defer @memory.free(threads)
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
