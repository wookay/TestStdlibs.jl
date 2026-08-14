module test_profile_memory

using Test
using Profile

foo() = 42
Profile.Allocs.@profile sample_rate=0.1 foo()

results = Profile.Allocs.fetch()
Profile.Allocs.print(devnull, results)
Profile.Allocs.clear()

# Memory profiling
# - `Profile.Allocs.@profile [sample_rate=0.1] foo()` to sample allocations within a specific call. A sample rate of 1.0 will record everything; 0.0 will record nothing.
# - `Profile.Allocs.print()` to print the report.
# - `Profile.Allocs.clear()` to clear the buffer.

end # module test_profile_memory
