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

uuid_repl = Base.UUID("3fa0cd96-eef1-5676-8a61-b3b8758bbffb")
@test Pkg.Types.is_stdlib(uuid_repl, VERSION)
pkgid_repl = Base.PkgId(uuid_repl, "REPL")
@test Base.is_stdlib(pkgid_repl)

pkgid_core = Base.PkgId(nothing, "Core")
pkgid_base = Base.PkgId(nothing, "Base")
pkgid_main = Base.PkgId(nothing, "Main")
@test [pkgid_core, pkgid_base, pkgid_main] ⊆ Base._sysimage_modules

end # module test_pkg_pkg_id
