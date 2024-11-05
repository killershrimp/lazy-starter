return {
  require("lazy").setup({
    {
      "nvim-treesitter/nvim-treesitter",
      build = ":TSUpdate",
      config = function()
        local configs = require("nvim-treesitter.configs")
        diagnostics = { disable = { "missing-fields" } }

        configs.setup({
          ensure_installed = {
            "c",
            "cpp",
            "dockerfile",
            "lua",
            "vim",
            "vimdoc",
            "query",
            "elixir",
            "heex",
            "javascript",
            "html",
            "latex",
            "make",
            "proto",
            "python",
            "rust",
          },
          sync_install = false,
          highlight = { enable = false },
          indent = { enable = true },
        })
      end,
    },
  }),
}
