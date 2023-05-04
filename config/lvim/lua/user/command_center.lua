local command_center = require("command_center")
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
command_center.add(general)
command_center.add(buffers)
command_center.add(lsp)
command_center.add(telescope)
command_center.add(hop)
command_center.add(lunarvim)

lvim.builtin.telescope.extensions.command_center = {
  components = {
    command_center.component.CATEGORY,
    command_center.component.DESCRIPTION,
    command_center.component.COMMAND,
    command_center.component.KEYBINDINGS,
  },
  sort_by = {
    command_center.component.CATEGORY,
    command_center.component.DESCRIPTION,
    command_center.component.COMMAND,
    command_center.component.KEYBINDINGS,
  },
  separator = " ",
  auto_replace_desc_with_cmd = true,
  prompt_title = "Command Center",
}
