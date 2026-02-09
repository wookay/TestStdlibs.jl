module test_toml_parse

using Test
using TOML

s = """
[packages]
EmojiSymbols = ["c599478c-de41-4aed-94ea-b47665d7a42a", 0xfafbfcfdb5e962dcd32087a491e5d32d]
"""
d = TOML.parse(s)

packages = d["packages"]
(uuid_str, build_id) = packages["EmojiSymbols"]
@test uuid_str == "c599478c-de41-4aed-94ea-b47665d7a42a"
@test build_id == 0xfafbfcfdb5e962dcd32087a491e5d32d

@test sprint(TOML.print, d) == s

end # module test_toml_parse
