-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
require("lazy").setup({ { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" } })
require("lspconfig").pyright.setup({})

-- color scheme
require("rose-pine").setup({
  variant = "moon", -- auto, main, moon, or dawn
  dark_variant = "moon", -- main, moon, or dawn
  dim_inactive_windows = false,
  extend_background_behind_borders = true,

  enable = {
    terminal = true,
    legacy_highlights = true, -- Improve compatibility for previous versions of Neovim
    migrations = true, -- Handle deprecated options automatically
  },

  styles = {
    bold = true,
    italic = true,
    transparency = false,
  },

  groups = {
    border = "muted",
    link = "iris",
    panel = "surface",

    error = "love",
    hint = "iris",
    info = "foam",
    note = "pine",
    todo = "rose",
    warn = "gold",

    git_add = "foam",
    git_change = "rose",
    git_delete = "love",
    git_dirty = "rose",
    git_ignore = "muted",
    git_merge = "iris",
    git_rename = "pine",
    git_stage = "iris",
    git_text = "rose",
    git_untracked = "subtle",

    h1 = "iris",
    h2 = "foam",
    h3 = "rose",
    h4 = "gold",
    h5 = "pine",
    h6 = "foam",
  },

  pallete = {
    -- Override the builtin palette per variant
    -- moon = {
    --     base = '#18191a',
    --     overlay = '#363738',
    -- },
  },

  highlight_groups = {
    -- Comment = { fg = "foam" },
    -- VertSplit = { fg = "muted", bg = "muted" },
  },

  before_highlight = function(group, highlight, palette)
    -- Disable all undercurls
    -- if highlight.undercurl then
    --     highlight.undercurl = false
    -- end
    --
    -- Change palette colour
    -- if highlight.fg == palette.pine then
    --     highlight.fg = palette.foam
    -- end
  end,
})

vim.cmd("colorscheme rose-pine-moon")
