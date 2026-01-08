module test_markdown_config

using Test
using Markdown: Markdown,
                Config, config, flavors, julia, github

@test julia isa Config
@test github isa Config
@test julia == flavors[:julia]
@test julia.inner['$'] == [Markdown.tex, Markdown.interp]

c = config(Markdown.link)
@test c isa Config

end # module test_markdown_config
