return {
  "benlubas/molten-nvim",
  version = "^1.0.0", -- use version <2.0.0 to avoid breaking changes
  dependencies = { "3rd/image.nvim" },
  build = ":UpdateRemotePlugins",
  --   require("image").setup({
  --     backend = "kitty", -- Kitty will provide the best experience, but you need a compatible terminal
  --     integrations = {}, -- do whatever you want with image.nvim's integrations
  --     max_width = 100, -- tweak to preference
  --     max_height = 12, -- ^
  --     max_height_window_percentage = math.huge, -- this is necessary for a good experience
  --     max_width_window_percentage = math.huge,
  --     window_overlap_clear_enabled = true,
  --     window_overlap_clear_ft_ignore = { "cmp_menu", "cmp_docs", "" },
  --   }),
  init = function()
    -- this is an example, not a default. Please see the readme for more configuration options
    vim.g.molten_output_win_max_height = 12
  end,
}
