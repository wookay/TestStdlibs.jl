module test_sparsearrays_non_numerical_data

using Test
using TestStdlibs # precompile SparseArrays.sparse(::Vector{String}) in ext/SparseArraysExt.jl
using SparseArrays

Base.zero(s::String)  = ""
A = sparse(["a", "b"])
@test A[1] == "a"

end # module test_sparsearrays_non_numerical_data
