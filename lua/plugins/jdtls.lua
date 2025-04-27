-- LSP Java extensions.
-- https://github.com/MariaSolOs/dotfiles/blob/8cdc092c0c340f669bef33a932f235dcde3c2019/.config/nvim/lua/plugins/jdtls.lua#L4
return {
  {
    "mfussenegger/nvim-jdtls",
    ft = "java",
    -- I only need this on Mac.
    enabled = function()
      return vim.uv.os_uname().sysname == "Darwin"
    end,
  },
}
