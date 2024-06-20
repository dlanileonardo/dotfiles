require "config.options"
require "config.keymaps"
require "config.lazy"
require "config.autocmds"
require "config.neovide"
require "config.general"

local commands = require "config.commands"
commands.load(commands.defaults)

require("core.autocmds").configure_format_on_save()
