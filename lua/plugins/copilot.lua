-- from https://github.com/MariaSolOs/dotfiles/blob/e9eb1f8e027840f872e69e00e082e2be10237499/.config/nvim/lua/plugins/copilot.lua
return {
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    opts = {
      -- I don't find the panel useful.
      panel = { enabled = false },
      suggestion = {
        auto_trigger = true,
        -- Use alt to interact with Copilot.
        keymap = {
          -- Disable the built-in mapping, we'll configure it in nvim-cmp.
          accept = false,
          accept_word = "<M-w>",
          accept_line = "<M-l>",
          next = "<M-]>",
          prev = "<M-[>",
          dismiss = "/",
        },
      },
      filetypes = { markdown = true },
    },
    config = function(_, opts)
      --   local cmp = require("cmp")
      --   local copilot = require("copilot.suggestion")
      --   local luasnip = require("luasnip")
      --
      --   require("copilot").setup(opts)
      --
      --   local function set_trigger(trigger)
      --     vim.b.copilot_suggestion_auto_trigger = trigger
      --     vim.b.copilot_suggestion_hidden = not trigger
      --   end
      --
      --   -- Hide suggestions when the completion menu is open.
      --   cmp.event:on("menu_opened", function()
      --     if copilot.is_visible() then
      --       copilot.dismiss()
      --     end
      --     set_trigger(false)
      --   end)
      --
      --   -- Disable suggestions when inside a snippet.
      --   cmp.event:on("menu_closed", function()
      --     set_trigger(not luasnip.expand_or_locally_jumpable())
      --   end)
      --   vim.api.nvim_create_autocmd("User", {
      --     pattern = { "LuasnipInsertNodeEnter", "LuasnipInsertNodeLeave" },
      --     callback = function()
      --       set_trigger(not luasnip.expand_or_locally_jumpable())
      --     end,
      --   })
    end,
  },
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    dependencies = {
      { "zbirenbaum/copilot.lua" },
      { "nvim-lua/plenary.nvim", branch = "master" }, -- for curl, log and async functions
    },
    build = "make tiktoken", -- Only on MacOS or Linux
    opts = {
      window = {
        width = 0.25,
      },
    },
    keys = {
      {
        "<Leader>ch",
        ":'<,'>CopilotChat<CR>",
        mode = { "v" },
        desc = "Copilot Chat Selection",
      },
      {
        "<Leader>ch",
        ":CopilotChatToggle<CR>",
        mode = { "n" },
        desc = "Toggle Copilot Chat",
      },
    },
    -- See Commands section for default commands if you want to lazy load on them
  },
}
