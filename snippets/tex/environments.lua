-- require("luasnip.loaders.from_lua").lazy_load()
local tsutils = require("tsutils")
in_mathzone = tsutils.in_mathzone()
in_comment = tsutils.in_comment()
in_text = tsutils.in_text()

-- Summary: When `LS_SELECT_RAW` is populated with a visual selection, the function
-- returns an insert node whose initial text is set to the visual selection.
-- When `LS_SELECT_RAW` is empty, the function simply returns an empty insert node.
local get_visual = function(args, parent)
  if #parent.snippet.env.LS_SELECT_RAW > 0 then
    return sn(nil, i(1, parent.snippet.env.LS_SELECT_RAW))
  else -- If LS_SELECT_RAW is empty, return a blank insert node
    return sn(nil, i(1))
  end
end
-- local in_mathzone = function()
--   -- The `in_mathzone` function requires the VimTeX plugin
--   return vim.api.nvim_eval("vimtex#syntax#in_mathzone()") == 1
--   -- return vim.fn["vimtex#syntax#in_mathzone"]() == 1
-- end

return {
  s(
    {
      trig = "aln",
      wordTrig = true,
      snippetType = "autosnippet",
      dscr = "LaTeX align environment",
    },
    fmt( -- The snippet code actually looks like the equation environment it produces.
      [[
      \begin{align*}
          <>
      \end{align*}
    ]],
      { i(1) },
      { delimiters = "<>" },
      { condition = in_text }
    )
  ),

  s(
    { trig = "eq", wordTrig = true, dscr = "LaTeX equation" },
    fmt( -- The snippet code actually looks like the equation environment it produces.
      [[
      \begin{equation*}
          <>
      \end{equation*}
    ]],
      { i(1) },
      { delimiters = "<>" }
    )
  ),
  s(
    { trig = "lrc", wordTrig = true, snippetType = "autosnippet" },
    fmta(
      [[
      \left\{<>\right\}
    ]],
      {
        i(1),
      },
      { condition = in_mathzone }
    )
  ),
  s(
    { trig = "lrb", wordTrig = true, snippetType = "autosnippet" },
    fmta(
      [[
      \left[<>\right]
    ]],
      {
        i(1),
      },
      { condition = in_mathzone }
    )
  ),
  s(
    { trig = "lrp", wordTrig = true, snippetType = "autosnippet" },
    fmta(
      [[
      \left(<>\right)
    ]],
      {
        i(1),
      },
      { condition = in_mathzone }
    )
  ),
  s(
    { trig = "env", wordTrig = true, snippetType = "autosnippet" },
    fmta(
      [[
      \begin{<>}
          <>
      \end{<>}
    ]],
      {
        i(1),
        i(2),
        rep(1),
      },
      { condition = in_text }
    )
  ),
  s(
    { trig = "([^%a])mm", wordTrig = false, regTrig = true, snippetType = "autosnippet" },
    fmta("<>$<>$", {
      f(function(_, snip)
        return snip.captures[1]
      end),
      d(1, get_visual),
    }, { condition = in_text })
  ),

  s(
    { trig = "([^%a])ff", regTrig = true, wordTrig = false, snippetType = "autosnippet", dscr = "LaTeX fraction" },
    fmta("<>\\frac{<>}{<>}", {
      f(function(_, snip)
        return snip.captures[1]
      end),
      d(1, get_visual),
      i(2),
    }, { condition = in_mathzone })
  ),
  s(
    { trig = "lbl", snippetType = "autosnippet" },
    fmta(
      [[
      \label{<>}
      ]],
      {
        d(1, get_visual),
      }
    )
  ),
  s(
    {
      trig = "qq",
      wordTrig = true,
      snippetType = "autosnippet",
    },
    fmt( -- The snippet code actually looks like the equation environment it produces.
      [[
      \begin{question}
          <>
      \end{question}
    ]],
      { i(1) },
      { delimiters = "<>" },
      { condition = in_text }
    )
  ),
  s(
    {
      trig = "pp",
      wordTrig = true,
      snippetType = "autosnippet",
    },
    fmt( -- The snippet code actually looks like the equation environment it produces.
      [[
      \begin{part}
          <>
      \end{part}
    ]],
      { i(1) },
      { delimiters = "<>" },
      { condition = in_text }
    )
  ),
  s({
    trig = "trt",
    wordTrig = false,
    snippetType = "autosnippet",
  }, fmta("^T <>", { i(1) }, { condition = in_mathzone })),
  s({
    trig = "ii",
    wordTrig = false,
    snippetType = "autosnippet",
  }, fmta("^{-1} <>", { i(1) }, { condition = in_mathzone })),
}
