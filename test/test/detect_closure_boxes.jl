using Jive
# julia commit 1c9ecc21b8
@If VERSION >= v"1.14.0-DEV.1629" module test_Test_detect_closure_boxes

using Test

Test.detect_closure_boxes
Test.detect_closure_boxes_all_modules

# from julia/stdlib/Test/test/runtests.jl
module ClosureBoxRedefTest
    function boxed()
        x = 1
        inner() = (x += 1)
        (inner(), x)
    end
end

@test ClosureBoxRedefTest.boxed() == (2, 2)
@test Test.detect_closure_boxes(ClosureBoxRedefTest)[1][2] == [:x]

Base.eval(ClosureBoxRedefTest, quote
    function boxed()
        x = 1
        inner() = x + 1
        (inner(), x)
    end
end)

@test ClosureBoxRedefTest.boxed() == (2, 1)
@test isempty(Test.detect_closure_boxes(ClosureBoxRedefTest))

end # module test_Test_detect_closure_boxes
