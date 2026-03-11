module test_libgit2_repo

using Test
using LibGit2: LibGit2
using .LibGit2: GitRepo, GitHash, GitCommit, GitTree, GitTreeEntry, GitBlob, GitBlame, BlameHunk

function test_repo(repo::GitRepo)
    oid::GitHash = GitHash("ce0d66e54def07797bd99394ac0ea3eff691466a")

    c::GitCommit = GitCommit(repo, oid)
    @test GitHash(c) == oid
    @test LibGit2.parentcount(c) == 1
    @test LibGit2.parent_id(c, 1) == GitHash(LibGit2.parent(c, 1))
    @test LibGit2.message(c) == "move from TestJulia07\n"

    tree::GitTree = GitTree(c)
    @test LibGit2.count(tree) == 5
    @test GitHash(tree) == GitHash("f5ce37efa9ef3c7aadd22e9b134b6f55b17ea768")
    @test LibGit2.repository(tree) == repo

    tree_entry::GitTreeEntry = tree[3]
    @test LibGit2.filename(tree_entry) == "README.md"
    @test LibGit2.entrytype(tree_entry) === GitBlob
    @test LibGit2.entryid(tree_entry) == GitHash("9944c05ffce2ee5f42ec7cd253b6ba5ee0bf2c14")

    blob::GitBlob = GitBlob(tree_entry)
    @test contains(LibGit2.content(blob), "Build Status")

    st = LibGit2.status(repo, "test/libgit2/fetch.jl")
    @test st == LibGit2.Consts.STATUS_CURRENT

    blame::GitBlame = GitBlame(repo, "test/libgit2/fetch.jl")
    @test LibGit2.counthunks(blame) == 1

    blame_hunk::BlameHunk = blame[1]
    @test blame_hunk.orig_commit_id == oid
    @test unsafe_string(blame_hunk.summary) == "move from TestJulia07"
end

repo::GitRepo = GitRepo(normpath(@__DIR__, "../../"))
try
    test_repo(repo)
catch e
    @info :error e  # LibGit2.GitError
end

end # module test_libgit2_repo
