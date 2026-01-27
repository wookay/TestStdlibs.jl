module test_sparsearrays_sparse

using Test
using SparseArrays

A = sparse([5 2 0;
            0 5 0;
            9 2 1])

(ind, v) = first(pairs(A))
@test ind == CartesianIndex(1, 1)
@test v == 5

@test indexin([100, 100, 200, 300], [100]) == [1, 1, nothing, nothing]

a = sparse([100, 100, 200, 300])
@test indexin(a, [100]) == [1, 1, nothing, nothing]

if VERSION >= v"1.7.0-DEV.1299"
@test sprint(show, sparse(reshape(1:9,3,:))) == "sparse([1, 2, 3, 1, 2, 3, 1, 2, 3], [1, 1, 1, 2, 2, 2, 3, 3, 3], [1, 2, 3, 4, 5, 6, 7, 8, 9], 3, 3)"
elseif VERSION >= v"1.6.0-DEV.78"
@test sprint(show, sparse(reshape(1:9,3,:))) == "\n 1  4  7\n 2  5  8\n 3  6  9"
end

end # module test_sparsearrays_sparse
