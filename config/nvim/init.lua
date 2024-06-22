require "config.options"
require "config.keymaps"
require "config.lazy"
require "config.autocmds"
require "config.neovide"
require "config.general"
require "config.highlight"

local commands = require "config.commands"
commands.load(commands.defaults)
