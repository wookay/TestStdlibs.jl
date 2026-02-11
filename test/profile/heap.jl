module test_profile_heap

using Test
using Profile
Profile.take_heap_snapshot

# from julia/stdlib/Profile/test/runtests.jl
const x = "redact_this"
heapsnapshot_filepath = Profile.take_heap_snapshot(; redact_data=false)
@test isfile(heapsnapshot_filepath)
rm(heapsnapshot_filepath)

# Heap profiling
# - `Profile.take_heap_snapshot()` to record a `.heapsnapshot` record of the heap.
# - Set `JULIA_PROFILE_PEEK_HEAP_SNAPSHOT=true` to capture a heap snapshot when signal SIGUSR1 is sent.

end # module test_profile_heap
