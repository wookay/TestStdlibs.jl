module test_profile_cpu

using Test
using Profile

Profile.init()

foo() = 42
@profile foo()

data = Profile.fetch()
if isempty(data)
else
    Profile.print(stdout, data; format = :flat, groupby = :thread)
    Profile.clear()
end

# CPU profiling
# - `@profile foo()` to profile a specific call.
# - `Profile.print()` to print the report. Paths are clickable links in supported terminals and specialized for JULIA_EDITOR etc.
# - `Profile.clear()` to clear the buffer.
# - Send a SIGUSR1 (on linux) or SIGINFO (on macOS/BSD) signal to the process to automatically trigger a profile and print.
#   i.e. `kill -s SIGUSR1/SIGINFO 1234`, where 1234 is the pid of the julia process. On macOS & BSD platforms `ctrl-t` can be used directly.

end # module test_profile_cpu
