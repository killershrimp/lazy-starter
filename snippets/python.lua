return {
  s(
    {
      trig = "printf",
      wordTrig = true,
      snippetType = "autosnippet",
      dscr = "print variable",
    },
    fmt(
      [[
      print(f"<>: {<>}")
      ]],
      { i(1), rep(1) },
      { delimiters = "<>" }
    )
  ),
}
