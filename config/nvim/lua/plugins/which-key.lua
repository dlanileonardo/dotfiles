local icons = require "plugins.utils.icons"

local M = {
  "folke/which-key.nvim",
  opts = {
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
