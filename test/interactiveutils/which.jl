module test_interactiveutils_which

using Test
using InteractiveUtils

@test @which(+) === Base

meth = @which(1+2)
@test meth.file === Symbol("int.jl")

end # module test_interactiveutils_which
