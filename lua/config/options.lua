-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.g.mapleader = " "
vim.g.python3_host_prog = vim.fn.expand("~/.virtualenvs/neovim/bin/python3")

vim.opt.cursorcolumn = true
vim.opt.scrolloff = 10
vim.opt.smoothscroll = true
vim.opt.updatetime = 100 -- faster completion time
