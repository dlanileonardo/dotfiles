local M = {
  'phaazon/hop.nvim',
  lazy = true,
  -- event = "BufRead",
  branch = 'v2',
  keys = {
    { "ff", "<cmd>HopWord<cr>",                                                   desc = "Hop Word" },
    { "fl", "<cmd>HopLine<cr>",                                                   desc = "Hop Line" },
    { "fs", "<cmd>HopLineStart<cr>",                                              desc = "Hop Line Start" },
    { "fd", "<cmd>lua require'hop'.hint_words({ current_line_only = true })<cr>", desc = "Hop in Current Line" },
    { "fc", "<cmd>HopChar1<cr>",                                                  desc = "Hop Char1" },
    { "fp", "<cmd>HopPattern<cr>",                                                desc = "Hop Pattern" },
  },
  opts = {}
}
return M
