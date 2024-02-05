local M = {
  enabled = true,
  'nacro90/numb.nvim',
  lazy = true,
  event = "BufRead",
  opts = {
    show_numbers = true,
    show_cursorline = true,
  }
}
return M
