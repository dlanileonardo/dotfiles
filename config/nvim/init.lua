require "options"
require "keymaps"
require "Lazy"
require "autocommands"
require "neovide"
require "cmd_center"

local commands = require "commands"
commands.load(commands.defaults)
