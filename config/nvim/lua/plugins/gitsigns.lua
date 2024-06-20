local icons = require "plugins.utils.icons"

local M = {
  "lewis6991/gitsigns.nvim",
  event = "BufReadPre",
  enable = true,
}

M.opts = {
  signs = {
    add = { hl = "GitSignsAdd", text = icons.ui.BoldLineLeft, numhl = "GitSignsAddNr", linehl = "GitSignsAddLn" },
    change = {
      hl = "GitSignsChange",
      text = icons.ui.BoldLineLeft,
      numhl = "GitSignsChangeNr",
      linehl = "GitSignsChangeLn",
    },
    delete = {
      hl = "GitSignsDelete",
      text = icons.ui.Triangle,
      numhl = "GitSignsDeleteNr",
      linehl = "GitSignsDeleteLn",
    },
    topdelete = {
      hl = "GitSignsDelete",
      text = icons.ui.Triangle,
      numhl = "GitSignsDeleteNr",
      linehl = "GitSignsDeleteLn",
    },
    changedelete = {
      hl = "GitSignsChange",
      text = icons.ui.BoldLineLeft,
      numhl = "GitSignsChangeNr",
      linehl = "GitSignsChangeLn",
    },
  },
  signcolumn = true, -- Toggle with `:Gitsigns toggle_signs`
  watch_gitdir = {
    interval = 1000,
    follow_files = true,
  },
  numhl = true,
  auto_attach = true,
  attach_to_untracked = true,
  current_line_blame = true,
  current_line_blame_opts = {
    virt_text = true,
    virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
    delay = 1000,
    ignore_whitespace = false,
    virt_text_priority = 100,
  },
  current_line_blame_formatter = "<author>, <author_time:%Y-%m-%d> - <summary>",
  sign_priority = 6,
  update_debounce = 100,
  status_formatter = nil, -- Use default
  preview_config = {
    -- Options passed to nvim_open_win
    border = "single",
    style = "minimal",
    relative = "cursor",
    row = 0,
    col = 1,
  },
  yadm = {
    enable = false,
  },
}

return M
