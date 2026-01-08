module test_markdown_parse

using Test
using Markdown: Markdown,
                META, meta, triggers, breaking

@test META isa IdDict{Function, Dict{Symbol, Any}}
@test meta(Markdown.link) == META[Markdown.link]

# keys(META)
Markdown.indentcode
Markdown.github_table
Markdown.asterisk_italic
Markdown.setextheader
Markdown.footnote_link
Markdown.blockinterp
Markdown.list
Markdown.fencedcode
Markdown.underscore_italic
Markdown.link
Markdown.footnote
Markdown.blocktex
Markdown.paragraph
Markdown.underscore_bold
Markdown.tex
Markdown.asterisk_bold
Markdown.github_paragraph
Markdown.interp
Markdown.hashheader
if VERSION >= v"1.13.0-DEV.179"
    Markdown.en_or_em_dash
else
    Markdown.en_dash
end
Markdown.autolink
Markdown.linebreak
Markdown.horizontalrule
Markdown.escapes
Markdown.inline_code
Markdown.admonition
Markdown.image
Markdown.blockquote

triggers ###
@test triggers(Markdown.admonition) ==
      meta(Markdown.admonition)[:triggers] ==
      Set{Char}()

@test triggers(Markdown.link) ==
      meta(Markdown.link)[:triggers] ==
      Set('[')

breaking ###
@test breaking(Markdown.admonition) ==
      meta(Markdown.admonition)[:breaking] ==
      true

@test breaking(Markdown.link) ==
      haskey(meta(Markdown.link), :breaking) ==
      false

end # module test_markdown_parse
