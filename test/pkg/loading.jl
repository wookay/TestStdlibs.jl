module test_pkg_loading

using Test
using Pkg

# julia/base/loading.jl
Base.find_package
Base.identify_package
Base.identify_package_env
Base.locate_package
Base.is_stdlib
Base.module_build_id

pkg_path::String = Base.find_package("Pkg")
@test pathof(Pkg) == pkg_path

pkgid_pkg::Base.PkgId = Base.identify_package("Pkg")
@test Base.PkgId(Pkg) == pkgid_pkg
@test pkgid_pkg == Base.identify_package(Pkg, "Pkg")

(pkgid, env) = Base.identify_package_env(Pkg, "Pkg")
@test pkgid == pkgid_pkg
@test env === nothing

@test Base.locate_package(pkgid_pkg) == pkg_path

@test Base.is_stdlib(pkgid_pkg)

modbuild_id = Base.module_build_id(Pkg)
@test modbuild_id isa UInt128

end # module test_pkg_loading
