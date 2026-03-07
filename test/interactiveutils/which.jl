module test_interactiveutils_which

using Test
using InteractiveUtils

@test @which(+) === Base

meth = @which(2pi)
@test meth isa Method
@test meth.file === Symbol("promotion.jl")

end # module test_interactiveutils_which
