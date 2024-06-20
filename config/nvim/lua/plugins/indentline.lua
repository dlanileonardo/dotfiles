local M = {
  "lukas-reineke/indent-blankline.nvim",
  event = "BufReadPre",
  main = "ibl",
  opts = {
    indent = {
      char = "▎",
      smart_indent_cap = true,
    },
    scope = {
      enabled = true,
      show_start = true,
      show_end = false,
      -- exclude = {
      --   language = {
      --     "help",
      --   },
      -- },
    },
  },
}

return M
