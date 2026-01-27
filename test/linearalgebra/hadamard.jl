module test_linearalgebra_hadamard

using Test
using LinearAlgebra

hadamard = .*

A = [1 2; 3 4]
B = [5 6; 7 8]

@test hadamard(A, B) == [  5  12;
                          21  32]

end # module test_linearalgebra_hadamard
