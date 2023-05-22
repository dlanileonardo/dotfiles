local utils = require("user.utils")
require "user.plugins"
require "user.config_plugins"
require "user.general"
utils.loadrequire("user.styles." .. lvim.colorscheme)
require "user.lsp"
require "user.dap"
require "user.which_key"
require "user.keymaps"
require "user.command_center"
require "user.neovide"
-- require "user.terminal"
