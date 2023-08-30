vim.cmd("setlocal colorcolumn=120")

local capabilities = vim.lsp.protocol.make_client_capabilities()

-- local dap = require('dap')

-- capabilities.textDocument.documentHighlight = true
-- capabilities.textDocument.completion.completionItem.snippetSupport = true

vim.cmd("setlocal tabstop=4 shiftwidth=4")

local opts = {
  capabilities = capabilities,
}

require("lspconfig").tsserver.setup({
  capabilities = capabilities,
  init_options = {
    provideFormatter = true
  }
})

require("lspconfig").tailwindcss.setup({
  capabilities = capabilities,
})

-- require("lspconfig").setup("angularls", {
--   capabilities = capabilities,
-- })

vim.notify("typescript loaded")
