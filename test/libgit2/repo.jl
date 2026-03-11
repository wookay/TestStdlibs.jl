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

    path = "test/libgit2/fetch.jl"
    st = LibGit2.status(repo, path)
    @test st == LibGit2.Consts.STATUS_CURRENT

    blame::GitBlame = GitBlame(repo, path)
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

# from julia/stdlib/LibGit2/src/consts.jl
#=
const STATUS_CURRENT          = Cuint(0)
const STATUS_INDEX_NEW        = Cuint(1 << 0)
const STATUS_INDEX_MODIFIED   = Cuint(1 << 1)
const STATUS_INDEX_DELETED    = Cuint(1 << 2)
const STATUS_INDEX_RENAMED    = Cuint(1 << 3)
const STATUS_INDEX_TYPECHANGE = Cuint(1 << 4)
const STATUS_WT_NEW           = Cuint(1 << 7)
const STATUS_WT_MODIFIED      = Cuint(1 << 8)
const STATUS_WT_DELETED       = Cuint(1 << 9)
const STATUS_WT_TYPECHANGE    = Cuint(1 << 10)
const STATUS_WT_RENAMED       = Cuint(1 << 11)
const STATUS_WT_UNREADABLE    = Cuint(1 << 12)
const STATUS_IGNORED          = Cuint(1 << 14)
const STATUS_CONFLICTED       = Cuint(1 << 15)
=#

end # module test_libgit2_repo
