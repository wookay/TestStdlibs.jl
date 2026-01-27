module test_sharedarrays_sdata

using Test
using SharedArrays

@test sdata(SharedArray([1,2,3])) == [1,2,3]

end # module test_sharedarrays_sdata
