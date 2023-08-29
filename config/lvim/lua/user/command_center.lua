local commander = require("commander")
local general = require "user.command_center.general"
local buffers = require "user.command_center.buffer"
local lsp = require "user.command_center.lsp"
local telescope = require "user.command_center.telescope"
local hop = require "user.command_center.hop"
local lunarvim = require "user.command_center.lunarvim"

-- local noremap = { noremap = true }
-- local silent_noremap = { noremap = true, silent = true }

-- edit a default keymapping
-- lvim.builtin.which_key.on_config_done = function()
commander.add(general)
commander.add(buffers)
commander.add(lsp)
commander.add(telescope)
commander.add(hop)
commander.add(lunarvim)

commander.setup({
  components = {
    "CAT", "DESC", "KEYS", "CMD",
  },
  sort_by = {
    "CAT", "DESC", "CMD", "KEYS",
  },
  separator = "  ",
  auto_replace_desc_with_cmd = true,
  prompt_title = "Command Center",
  integration = {
    telescope = {
      enable = true,
    },
    lazy = {
      enable = true
    }
  },
})
