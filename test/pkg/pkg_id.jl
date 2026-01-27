module test_pkg_pkg_id

using Test
using Pkg

pkgid_pkg = Base.identify_package(Pkg, "Pkg")
@test pkgid_pkg isa Base.PkgId
@test pkgid_pkg.name == "Pkg"
@test pkgid_pkg.uuid == Base.UUID("44cfe95a-1eb2-52ea-b672-e2afdf69b78f")

pkgid_test = Base.identify_package(Test, "Test")
@test pkgid_test == Base.PkgId(Base.UUID("8dfed614-e22c-5e08-85e1-65c5234f0b40"), "Test")

if VERSION >= v"1.7"
    deps = Pkg.dependencies()
    @test !isempty(deps)
    @test deps[pkgid_test.uuid].version >= v"1.11"
end

end # module test_pkg_pkg_id
