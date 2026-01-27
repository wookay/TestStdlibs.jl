module test_linearalgebra_rank

using Test
using LinearAlgebra

@test rank(-5) == rank(5) == 1
@test rank(0) == 0
@test rank([ 0 0 0; 0 2 2; 0 3 3]) == 1
@test rank([ 0 0 0; 0 0 2; 0 3 3]) == 2

end # module test_linearalgebra_rank
