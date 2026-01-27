module test_statistics_cov

using Test
using Statistics

X = rand(5)

@test cor(X, 2X) == 1.0
@test cov(X, 2X) - cov(X, X) ≈ var(X)

end # module test_statistics_cov
