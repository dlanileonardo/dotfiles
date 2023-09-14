local M = {
  enabled = true,
  "f-person/git-blame.nvim",
  lazy = true,
  event = "BufRead",
  config = function()
    vim.cmd "highlight default link gitblame SpecialComment"
    vim.g.gitblame_enabled = 0
    vim.g.gitblame_date_format = '%r'
    vim.g.gitblame_display_virtual_text = 0
    vim.g.gitblame_virtual_text_column = 80
  end,
}
return M
