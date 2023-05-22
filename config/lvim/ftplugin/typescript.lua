local capabilities = vim.lsp.protocol.make_client_capabilities()
-- local dap = require('dap')

-- capabilities.textDocument.documentHighlight = true
-- capabilities.textDocument.completion.completionItem.snippetSupport = true

vim.cmd("setlocal tabstop=4 shiftwidth=4")

local opts = {
  capabilities = capabilities,
}

require("lvim.lsp.manager").setup("tsserver", {
  capabilities = capabilities,
  init_options = {
    provideFormatter = true
  }
})

require("lvim.lsp.manager").setup("tailwindcss", {
  capabilities = capabilities,
})

-- require("lvim.lsp.manager").setup("angularls", {
--   capabilities = capabilities,
-- })

vim.notify("typescript loaded")
