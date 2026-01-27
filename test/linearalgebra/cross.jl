module test_linearalgebra_cross

using Test
using LinearAlgebra

@test cross([2, 3, 4], [5, 6, 7]) == [-3, 6, -3]
# 3 * 7 - 4 * 6
# 4 * 5 - 2 * 7
# 2 * 6 - 3 * 5

end # module test_linearalgebra_cross
