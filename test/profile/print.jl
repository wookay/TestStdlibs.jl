module test_profile_print

using Test
using Profile

f() = 42
out = @profile f()
@test out == 42
Profile.print(devnull, C=true)

Profile.clear()
r = Profile.retrieve()
@test r == (UInt64[], Dict{UInt64, Vector{Base.StackTraces.StackFrame}}())

end # module test_profile_print
