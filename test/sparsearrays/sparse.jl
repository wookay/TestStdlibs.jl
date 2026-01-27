module test_sparsearrays_sparse

using Test
using SparseArrays

A = sparse([5 2 0;
            0 5 0;
            9 2 1])

(ind, v) = first(pairs(A))
@test ind == CartesianIndex(1, 1)
@test v == 5

end # module test_sparsearrays_sparse
