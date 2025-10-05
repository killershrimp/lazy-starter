return {
  s(
    {
      trig = "vv",
      wordTrig = true,
      snippetType = "autosnippet",
    },
    fmta(
      [[
      vector<[]>
      ]],
      { i(1) },
      { delimiters = "[]" }
    )
  ),
  s(
    { trig = "cpi", wordTrig = true, snippetType = "autosnippet" },
    fmt(
      [[
      #include <bits/stdc++.h>
      
      using namespace std;

      const int mod = 1e9 + 7;

      int main() {
        []
      }
      ]],
      {
        i(1),
      },
      { delimiters = "[]" }
    )
  ),
}
