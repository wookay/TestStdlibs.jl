module test_libgit2_walker

using Test
using LibGit2: LibGit2
using .LibGit2: GitRepo

function test_repo(repo::GitRepo)
    rev_walker = LibGit2.GitRevWalker(repo)

    oids = LibGit2.map(rev_walker, by = LibGit2.Consts.SORT_TIME) do oid, repo
        oid
    end

    cnt = LibGit2.count(rev_walker, by = LibGit2.Consts.SORT_TIME) do oid, repo
        true
    end

    @test length(oids) == cnt
end

repo::GitRepo = GitRepo(normpath(@__DIR__, "../../"))
test_repo(repo)

# from julia/stdlib/LibGit2/src/walker.jl
LibGit2.GitRevWalker

# from julia/stdlib/LibGit2/src/consts.jl
#=
const SORT_NONE        = Cint(0)
const SORT_TOPOLOGICAL = Cint(1 << 0)
const SORT_TIME        = Cint(1 << 1)
const SORT_REVERSE     = Cint(1 << 2)
=#

end # module test_libgit2_walker
