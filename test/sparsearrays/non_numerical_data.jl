module test_sparsearrays_non_numerical_data

using Test
using SparseArrays

Base.zero(s::String)  = ""
A = sparse(["a", "b"])
@test A[1] == "a"

end # module test_sparsearrays_non_numerical_data
