local M = {
  "gfeiyou/command-center.nvim",
  event = "VimEnter",
  lazy = false,
  keys = {
    { "<C-M-p>", "<cmd>lua require('commander').show()<cr>", desc = "Command Center" },
  },
  dependencies = {
    "nvim-telescope/telescope.nvim"
  }
}

function M.config()
  local commander = require "commander"
  local general = require "commander.general"
  local buffers = require "commander.buffer"
  local lsp = require "commander.lsp"
  local telescope = require "commander.telescope"
  local hop = require "commander.hop"
  local neovim = require "commander.neovim"
  local lazyvim = require "commander.lazyvim"

  commander.add(general)
  commander.add(buffers)
  commander.add(lsp)
  commander.add(telescope)
  commander.add(hop)
  commander.add(neovim)
  commander.add(lazyvim)

  commander.setup {
    components = {
      "CAT",
      "DESC",
      "KEYS",
      "CMD",
    },
    sort_by = {
      "CAT",
      "DESC",
      "CMD",
      "KEYS",
    },
    separator = "  ",
    auto_replace_desc_with_cmd = true,
    prompt_title = "Command Center",
    integration = {
      telescope = {
        enable = true,
      },
      lazy = {
        enable = true,
      },
    },
  }
end

return M
