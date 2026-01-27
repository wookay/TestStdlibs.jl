module test_linearalgebra_norm

using Test
using LinearAlgebra

@test (norm ∘ normalize)(rand(10)) ≈ 1

end # module test_linearalgebra_norm
