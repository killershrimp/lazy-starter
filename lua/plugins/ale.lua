return {
  "dense-analysis/ale",
  config = function()
    local max_line_length = 90
    -- Configuration goes here.
    local g = vim.g

    g.ale_linters = {
      lua = { "lua_language_server" },
      python = { "flake8" },
      c = { "clangtidy" },
      cpp = { "clangtidy" },
    }
    g.ale_fixers = {
      python = { "black", "isort", "yapf" },
      c = { "clang-format" },
      cpp = { "clang-format" },
    }
    g.ale_python_yapf_options = '--style "column_limit: ' .. max_line_length .. '"'
    g.ale_c_clangformat_style_options = "--style=Google"

    g.ale_fix_on_save = 1
  end,
}
