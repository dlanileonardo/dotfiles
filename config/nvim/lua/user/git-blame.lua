local M = {
  enabled = true,
  "f-person/git-blame.nvim",
  lazy = true,
  event = "BufRead",
  config = function()
    vim.cmd "highlight default link gitblame SpecialComment"
    vim.g.gitblame_enabled = 0
  end,
}
return M
