local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node

-- -- Place this in ${HOME}/.config/nvim/LuaSnip/all.lua
return {
  -- A snippet that expands the trigger "hi" into the string "Hello, world!".
  -- require("luasnip").snippet({ trig = "hip" }, { t("Hello, world!") }),

  --   -- To return multiple snippets, use one `return` statement per snippet file
  --   -- and return a table of Lua snippets.
  --   require("luasnip").snippet({ trig = "foo" }, { t("Another snippet.") }),
}
