module test_linearalgebra_dot

using Test
using LinearAlgebra

@test dot([1, 3, -5], [4, -2, -1]) == 3
# 1 * 4 + 3 * -2 + -5 * -1

@test [1 2; 3 4] * [5 6; 7 8] == [19 22; 43 50]
# 1 * 5 + 2 * 7    1 * 6 + 2 * 8
# 3 * 5 + 4 * 7    3 * 6 + 4 * 8

end # module test_linearalgebra_dot
