return {
  {
    "L3MON4D3/LuaSnip",
    -- follow latest release.
    version = "v2.3", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
    -- install jsregexp (optional!).
    build = "make install_jsregexp",
    config = function()
      require("luasnip.loaders.from_lua").load({
        paths = "./snippets",
      })

      local ls = require("luasnip")
      ls.config.set_config({
        enable_autosnippets = true,
        -- Use Tab (or some other key if you prefer) to trigger visual selection
        -- store_selection_keys = "<Tab>",
        update_events = "TextChanged,TextChangedI",
      })

      local M = {}

      function M.expand_or_jump()
        if ls.expand_or_jumpable() then
          ls.expand_or_jump()
        end
      end

      function M.jump_next()
        if ls.jumpable(1) then
          ls.jump(1)
        end
      end

      function M.jump_prev()
        if ls.jumpable(-1) then
          ls.jump(-1)
        end
      end

      function M.change_choice()
        if ls.choice_active() then
          ls.change_choice(1)
        end
      end

      local set = vim.keymap.set

      local mode = { "i", "s" }
      local normal = { "n" }

      set(mode, "<c-i>", M.expand_or_jump)
      set(mode, "kl", M.jump_prev)
      set(mode, "jk", M.jump_next)
      -- set(mode, '<c-l>', M.change_choice)
    end,
  },
}
