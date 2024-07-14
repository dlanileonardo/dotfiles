local icons = require "plugins.utils.icons"

local M = {
  "folke/which-key.nvim",
  -- commit = "0539da005b98b02cf730c1d9da82b8e8edb1c2d2",
  opts = {
    win = {
      no_overlap = false,
    },
    plugins = { spelling = true },
    -- defaults = {
    --   mode = { "n", "v" },
    --   { "<leader>d", group = "debug" },
    --   { "<leader>o", group = "overseer" },
    --   { "<leader>t", group = "trouble" },
    --   { "<leader>y", group = "tests" },
    -- },
  },
}

return M
