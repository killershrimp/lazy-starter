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
      "LaTeX Font Warning:",
    }

    vim.g.vimtex_syntax_enabled = 0 -- Keep this to use your tex_light syntax
    -- Enable conceal with vimtex syntax
    vim.g.vimtex_syntax_conceal = {
      accents = 1,
      ligatures = 1,
      cites = 0, -- Disable for performance
      fancy = 1,
      spacing = 0, -- Disable for performance
      greek = 1,
      math_bounds = 1,
      math_delimiters = 1,
      math_fracs = 1,
      math_super_sub = 1,
      math_symbols = 1,
      sections = 0,
      styles = 0, -- Disable for performance
    }

    -- Set conceal level
    vim.opt.conceallevel = 2
    vim.opt.concealcursor = "niv" -- Show concealed text in normal, insert, visual modes

    -- Create ~/.config/nvim/syntax/tex_light.vim with the syntax rules above, then:
    vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
      pattern = "*.tex",
      callback = function()
        vim.wo.conceallevel = 2
        vim.wo.concealcursor = "niv"
        vim.bo.syntax = "tex_light"
      end,
    })
  end,
}
