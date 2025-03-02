return {
  "lervag/vimtex",
  lazy = false, -- we don't want to lazy load VimTeX
  -- tag = "v2.15", -- uncomment to pin to a specific release
  init = function()
    -- VimTeX configuration goes here, e.g.
    vim.g.vimtex_view_method = "skim"
    vim.g.vimtex_complete_enabled = "false"
    vim.g.vimtex_matchparen_enabled = "false"
    vim.g.vimtex_imaps_enabled = 0
    vim.g.vimtex_delim_stopline = 50
    vim.g.vimtex_quickfix_ignore_filters = {
      "Underfull \\hbox",
      "Overfull \\hbox",
      "LaTeX Warning: .\\+ float specifier changed to",
    }
  end,
}
