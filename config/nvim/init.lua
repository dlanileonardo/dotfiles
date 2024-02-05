require "options"
require "keymaps"
require "Lazy"
require "autocommands"
require "neovide"
require "general"

local commands = require "commands"
commands.load(commands.defaults)

require("core.autocmds").configure_format_on_save()
