local capabilities = vim.lsp.protocol.make_client_capabilities()

-- capabilities.textDocument.completion.completionItem.snippetSupport = true

local rspec = require('nvim-test.runners.rspec'):setup {
}

function rspec:build_test_args(args, tests)
  local line = vim.api.nvim_win_get_cursor(0)[1]
  local name = table.remove(args)
  table.insert(args, name .. ":" .. line)
end

require 'lspconfig'.solargraph.setup {}

-- vim.notify("ruby loaded")
