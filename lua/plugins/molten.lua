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
    vim.keymap.set("n", "<localleader>mi", ":MoltenInit<CR>", { silent = true, desc = "Initialize the plugin" })
    vim.keymap.set(
      "n",
      "<localleader>e",
      ":MoltenEvaluateOperator<CR>",
      { silent = true, desc = "run operator selection" }
    )
    vim.keymap.set("n", "<localleader>rl", ":MoltenEvaluateLine<CR>", { silent = true, desc = "evaluate line" })
    vim.keymap.set("n", "<localleader>rr", ":MoltenReevaluateCell<CR>", { silent = true, desc = "re-evaluate cell" })
    vim.keymap.set(
      "v",
      "<localleader>r",
      ":<C-u>MoltenEvaluateVisual<CR>gv",
      { silent = true, desc = "evaluate visual selection" }
    )
    vim.keymap.set("n", "<localleader>rd", ":MoltenDelete<CR>", { silent = true, desc = "molten delete cell" })
    vim.keymap.set("n", "<localleader>oh", ":MoltenHideOutput<CR>", { silent = true, desc = "hide output" })
    vim.keymap.set(
      "n",
      "<localleader>os",
      ":noautocmd MoltenEnterOutput<CR>",
      { silent = true, desc = "show/enter output" }
    )
  end,
}
