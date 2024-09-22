using SigLab
using Documenter

DocMeta.setdocmeta!(SigLab, :DocTestSetup, :(using SigLab); recursive = true)

const page_rename = Dict("developer.md" => "Developer docs") # Without the numbers
const numbered_pages = [
  file for
  file in readdir(joinpath(@__DIR__, "src")) if file != "index.md" && splitext(file)[2] == ".md"
]

makedocs(;
    modules = [SigLab],
    authors = "Fernando Conde-Pumpido <fernando.conde.pumpido@outlook.com>",
    repo = "https://github.com/nandoconde/SigLab.jl/blob/{commit}{path}#{line}",
    sitename = "SigLab.jl",
    format = Documenter.HTML(; canonical = "https://nandoconde.github.io/SigLab.jl"),
    pages = ["index.md"; numbered_pages],
)

deploydocs(; repo = "github.com/nandoconde/SigLab.jl")
