module test_Test_detect_closure_boxes

using Test

if VERSION >= v"1.14.0-DEV.1629" # julia commit 1c9ecc21b8
Test.detect_closure_boxes
Test.detect_closure_boxes_all_modules
end

end # module test_Test_detect_closure_boxes
