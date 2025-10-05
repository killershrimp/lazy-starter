-- ~/.config/nvim/syntax/tex_light.lua

-- Clear any existing syntax
vim.cmd("syntax clear")

if vim.fn.exists("b:current_syntax") ~= 0 then
  return
end

-- Define syntax matches
vim.cmd("syntax match texComment '%.*$'")
vim.cmd("syntax match texCommand '\\\\[a-zA-Z@]*\\*\\?'")
vim.cmd("syntax match texMath '\\$[^$]*\\$'")
vim.cmd("syntax match texMathBlock '\\$\\$\\_.\\.\\{-\\}\\$\\$'")

-- Section commands and their names
vim.cmd(
  "syntax match texSection '\\\\\\(part\\|chapter\\|section\\|subsection\\|subsubsection\\|paragraph\\|subparagraph\\)\\*\\?'"
)
vim.cmd(
  "syntax match texSectionName '\\\\\\(part\\|chapter\\|section\\|subsection\\|subsubsection\\|paragraph\\|subparagraph\\)\\*\\?{[^}]*}' contains=texSection"
)

-- Begin/end environments
vim.cmd("syntax match texBeginEnd '\\\\\\(begin\\|end\\){[^}]*}'")
vim.cmd("syntax match texEnvironment '\\\\\\(begin\\|end\\){\\zs[^}]*\\ze}' contained")

-- Text formatting
vim.cmd("syntax match texEmph '\\\\emph{[^}]*}'")
vim.cmd("syntax match texBold '\\\\textbf{[^}]*}'")

-- References and citations
vim.cmd("syntax match texCite '\\\\cite[^}]*{[^}]*}'")
vim.cmd("syntax match texRef '\\\\ref{[^}]*}'")
vim.cmd("syntax match texLabel '\\\\label{[^}]*}'")

-- Define highlight links
vim.cmd("hi def link texComment Comment")
vim.cmd("hi def link texCommand Statement")
vim.cmd("hi def link texMath Special")
vim.cmd("hi def link texMathBlock Special")
vim.cmd("hi def link texSection Title")
vim.cmd("hi def link texSectionName String")
vim.cmd("hi def link texBeginEnd Statement")
vim.cmd("hi def link texEnvironment Type")
vim.cmd("hi def link texEmph Underlined")
vim.cmd("hi def link texBold Bold")
vim.cmd("hi def link texCite Identifier")
vim.cmd("hi def link texRef Identifier")
vim.cmd("hi def link texLabel Type")

-- Set the syntax name
vim.b.current_syntax = "tex_light"
