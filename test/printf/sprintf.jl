module test_printf_sprintf

using Test
using Printf # @sprintf

@test @sprintf("%.7f", 1/11025) == "0.0000907"

end # module test_printf_sprintf
