local command_center = require("command_center")
local general = require "command_center.general"
local buffers = require "command_center.buffer"
local lsp = require "command_center.lsp"
local telescope = require "command_center.telescope"
local hop = require "command_center.hop"

-- local noremap = { noremap = true }
-- local silent_noremap = { noremap = true, silent = true }

-- edit a default keymapping
-- lvim.builtin.which_key.on_config_done = function()
command_center.add(general)
command_center.add(buffers)
command_center.add(lsp)
command_center.add(telescope)
command_center.add(hop)
