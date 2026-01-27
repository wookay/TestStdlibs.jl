module test_linearalgebra_diagonal

using Test
using LinearAlgebra

A = [  4  12 -16;
      12  37 -43;
     -16 -43  98]
@test Diagonal(A) ==
      Diagonal(diag(A)) ==
      diagm(0=>diag(A)) ==
                           [  4   0   0;
                              0  37   0;
                              0   0  98]
@test I * A == A
@test I + A == Diagonal([1, 1, 1]) + A

end # module test_linearalgebra_diagonal
