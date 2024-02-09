-- vim.cmd("setlocal colorcolumn=120")

local capabilities = require("user.lsp.utils").capability()
-- local rspec = require('nvim-test.runners.rspec'):setup {}

-- function rspec:build_test_args(args, tests)
--   local line = vim.api.nvim_win_get_cursor(0)[1]
--   local name = table.remove(args)
--   table.insert(args, name .. ":" .. line)
-- end

local opts = {
  capabilities = capabilities,
}

require("lspconfig").solargraph.setup(opts)
-- require("lspconfig").rubocop.setup(opts)

-- vim.notify("ruby loaded")
