-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set("n", "<leader>cce", "<cmd>Copilot enable<CR>", { desc = "Enable Copilot" })
vim.keymap.set("n", "<leader>ccd", "<cmd>Copilot disable<CR>", { desc = "Disable Copilot" })
