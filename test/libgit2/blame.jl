module test_libgit2_blame

using Test
using LibGit2: LibGit2
using .LibGit2: GitHash

repo = LibGit2.GitRepo(normpath(@__DIR__, "../../"))

oid = GitHash("ce0d66e54def07797bd99394ac0ea3eff691466a")
try
    c = LibGit2.GitCommit(repo, oid)
    @test GitHash(c) == oid
    @test LibGit2.parentcount(c) == 1
    @test LibGit2.message(c) == "move from TestJulia07\n"

    blame = LibGit2.GitBlame(repo, "test/libgit2/fetch.jl")
    @test LibGit2.counthunks(blame) == 1
    blame_hunk = blame[1]
    @test blame_hunk.orig_commit_id == oid
    @test unsafe_string(blame_hunk.summary) == "move from TestJulia07"
catch e
    @info :error e  # LibGit2.GitError
end

end # module test_libgit2_blame
