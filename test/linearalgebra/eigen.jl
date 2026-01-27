module test_linearalgebra_eigen

using Test
using LinearAlgebra

A = [  4  12 -16;
      12  37 -43;
     -16 -43  98]

E1 = eigen(A)
E2 = eigen(2A)
@test E1.values ≈ [0.018804980460810916, 15.5039632294076, 123.47723179013143]
@test E2.values ≈ [0.03760996092162183 , 31.0079264588152, 246.95446358026285]
@test 2 * E1.values == E2.values
@test E1.vectors == E2.vectors

end # module test_linearalgebra_eigen
