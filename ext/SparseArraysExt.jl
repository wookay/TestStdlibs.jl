module SparseArraysExt

using SparseArrays: SparseArrays, SparseVector

import .SparseArrays: sparsevec
function sparsevec(x::Vector{String})
    len = length(x)
    SparseVector(len, collect(1:len), x)
end

end # module SparseArraysExt
