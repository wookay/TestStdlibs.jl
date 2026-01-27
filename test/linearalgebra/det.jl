module test_linearalgebra_det

using Test
using LinearAlgebra

A = [4 3;
     6 3]

@test det(A) == 4*3 - 3*6 == -6
@test det(exp(A)) ≈ exp(tr(A)) == 1096.6331584284585
@test sum(diag(A)) == tr(A) ≈ log(det(exp(A)))
@test tr(I - inv(A)) < tr(A - I)

A = [  4  12 -16;
      12  37 -43;
     -16 -43  98]
@test det(A) ≈ 36
@test det(2A) ≈ 288

end # module test_linearalgebra_det
