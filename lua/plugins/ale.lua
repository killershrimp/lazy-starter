return {
  "dense-analysis/ale",
  config = function()
    -- Configuration goes here.
    local g = vim.g

    g.ale_ruby_rubocop_auto_correct_all = 1

    g.ale_linters = {
      lua = { "lua_language_server" },
      python = { "flake8" },
    }
    g.ale_fixers = {
      python = { "black", "isort" },
    }

    g.ale_fix_on_save = 1
  end,
}
