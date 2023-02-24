local capabilities = vim.lsp.protocol.make_client_capabilities()

local rspec = require('nvim-test.runners.rspec'):setup {}

function rspec:build_test_args(args, tests)
  local line = vim.api.nvim_win_get_cursor(0)[1]
  local name = table.remove(args)
  table.insert(args, name .. ":" .. line)
end

local opts = {
  capabilities = capabilities,
}

require("lvim.lsp.manager").setup("solargraph", opts)
require("lvim.lsp.manager").setup("rubocop", opts)

vim.notify("ruby loaded")
