module test_dates_eps

using Test
using Dates

@test eps(Date) == Day(1)
@test eps(DateTime) == Millisecond(1)
@test eps(Time) == Nanosecond(1)

end # module test_dates_eps
