module test_sparsearrays_non_numerical_data

using Test
using TestStdlibs ### trigger SparseArraysExt SparseArrays.sparsevec(::Vector{String})
using SparseArrays: sparse

Base.zero(s::String)  = ""
A = sparse(["a", "b"])
@test A[1] == "a"

end # module test_sparsearrays_non_numerical_data
